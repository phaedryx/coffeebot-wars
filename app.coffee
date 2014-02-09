express = require('express')
path    = require('path')

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 8070
  app.use express.static(path.join(__dirname, 'public'))

app.configure 'development', -> app.use(express.errorHandler())

app.listen(app.get('port'))
console.log "Listening on port #{app.get('port')}"
