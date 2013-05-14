spellingStones = require '../src/spelling-stones.coffee'
doesSpell = spellingStones.doesSpell
spelledWords = spellingStones.spelledWords
spellWith = spellingStones.spellWith
chai = require 'chai'
chai.should()
expect = chai.expect

describe 'doesSpell predicate', ->
    it 'null string shoud not spell anything', ->
        doesSpell('','abc').should.equal false
    it 'abc spells \'bacca\'', ->
        doesSpell('abc','bacca').should.equal true

describe 'spelledWords function', ->
    it 'no stone should spell no word', ->
        spelledWords('').should.eql []
    it 'spelledWords by \'abc\' should contain \'bacca\'', ->
        expect(spelledWords('abc')).to.include.members(['bacca'])

describe 'spellWith', ->
    stones = ['ametista', 'corindone', 'birzone', 'lapislazzulo']
    it 'should spell \'bacca\' with ametista, corindone, birzone', ->
        spellWith('bacca', stones).should.eql \
            ['birzone', 'ametista', 'corindone', 'corindone', 'ametista']
