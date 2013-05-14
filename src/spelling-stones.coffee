fs = require('fs')
words = fs.readFileSync('italian.words').toString().split("\n")

doesSpell = (stones, word) -> 
    (letter in stones for letter in word).reduce(
                                            (x,y) -> x and y
                                            true)

spelledWords = (stones) -> 
    w for w in words when doesSpell(stones, w) and w.length > 0

takeFirst =  (array, predicate) ->
    for item in array
        if predicate(item) then return item
    return undefined

spellWith = (word, stones) ->
    takeFirst stones, ((x) -> x[0] == letter) for letter in word


module.exports.doesSpell = doesSpell
module.exports.spelledWords = spelledWords
module.exports.spellWith = spellWith
