module.exports = (app)->
  app.get '/', (req, res)->
    res.render 'index', layout: "layout"



  app.post '/users', (req, res)->

    console.log 'user', req.param('user')
    console.log 'password', req.param('password')
    if(req.param('user') == 'gentoo' &&
    req.param('password') == 'linux')

       req.session['user'] == req.param('email')

       res.json user: 'gentoo', admin: true, id: 1
    else
      res.send 412, 'Bad username or password'
