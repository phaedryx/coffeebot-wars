express = require('express')
app = express()

app.get '/', (req, res) -> res.send "Greetings programs"

app.listen 8070
console.log "listening on port 8070"
