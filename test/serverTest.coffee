http = require 'request'
should = require 'should'

describe 'Spelled Words', ->
    it '["ametista", "barlislazzulo", "corindone"] should spell at least "bacca"',
        (done) ->
            http.request(
                {
                    url: "localhost:9001/spelledWords"
                    qs:
                        words: ["ametista", "barlislazzulo", "corindone"]
                }, (err, res, data) ->
                    data.should.include("bacca")
            )
