express = require("express")
winston = require("winston")
logger = new winston.Logger
            transports:[
                new winston.transports.Console
                    timestamp:true
            ]

app = express()
port = 8001

app.use(express.logger())
app.use(express.static(__dirname))

#app.get "/hello", (req, res, next) -> res.send("ciao")

module.exports = app

if require.main == module
    logger.info("starting server on port ",port)
    app.listen(port)
