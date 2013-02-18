express = require("express")
http = require 'http'
assets = require 'connect-assets'
jade = require 'jade'
path = require 'path'
connect = require 'connect'


app = module.exports = express()


app.use express.cookieParser()
app.use express.session(secret: 'sid')
#app.use require('connect-assets')()
app.use assets(minifyBuilds: true)




assets.jsCompilers.jade =
  match: /\.jade$/
  compileSync: (sourcePath, source)->
    fileName = path.basename sourcePath, '.jade'
    directoryName = (path.dirname sourcePath).replace "#{__dirname}/assets/templates", ""
    jstPath = if directoryName then "#{directoryName}/#{fileName}" else fileName
    jstPath = jstPath.replace(/^\//, '')
    ""
    "define(function(require) {
      jade = require('jade');
      
      return #{jade.compile(source, client: true)}
    })"
    


fs = require('fs')
app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.set "view options", layout: "layout"
  app.use connect.bodyParser()
  app.use express.methodOverride()
  app.use require("stylus").middleware(src: __dirname + "/public")
  app.use app.router
  app.use express.static(__dirname + "/public")
#  app.use assets()

app.configure "development", ->
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

app.configure "production", ->
  app.use express.errorHandler()



routes = require("./routes")(app)


http.createServer(app).listen 1337, '127.0.0.1', ->
  console.log "listening on http://l:1337"
