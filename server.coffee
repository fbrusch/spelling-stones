spellingStones = require("./src/spelling-stones.coffee")
spellWith = spellingStones.spellWith
spelledWords = spellingStones.spelledWords
express = require("express")
winston = require("winston")
logger = new winston.Logger
            transports:[
                new winston.transports.Console
                    timestamp:true
            ]


lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet

app = express()
port = 8001

app.use(lrSnippet)
app.use(express.logger())
app.use(express.static(__dirname))

#app.get "/hello", (req, res, next) -> res.send("ciao")

app.get "/spellWith", (req, res) ->
    stones = JSON.parse(req.query.stones)
    res.send spellWith(req.query.word, stones)

app.get "/name", (req, res) ->
    res.send {name: "Francesco"}

app.get "/spelledWords", (req, res) ->
    stones = JSON.parse req.query.stones
    stonesFirstLetters = [x.charAt(0) for x in stones]
    res.send spelledWords(stonesFirstLetters)

module.exports = app

if require.main == module
    logger.info("starting server on port ",port)
    app.listen(port)
