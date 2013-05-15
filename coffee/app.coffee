capitalize = (string) ->
    try
        string.charAt(0).toUpperCase() + string.slice(1)
    catch error
        ""

app = angular.module "spelling-stones", ['ngResource']

app.controller "MainController", ($scope, $resource, stoneSpeller) ->
    
    $scope.word1 = "cazzo"
    $scope.word2 = "minchia"

    updateSpellingStones = ->
        $scope.spelledWord1 = stoneSpeller.spell $scope.stones.split("\n"),
                                                 $scope.word1
        $scope.spelledWord2 = stoneSpeller.spell $scope.stones.split("\n"),
                                                 $scope.word2

    $scope.$watch "word1", ->
        updateSpellingStones()

    $scope.$watch "word2", ->
        updateSpellingStones()

    #updateSpellingStones = (value) ->
        #$scope.spellingStones = stoneSpeller.spell $scope.stones.split("\n"), $scope.name.name


    $scope.$watch "stones", (value) ->
        updateSpellingStones()

    
    $scope.stones = [
       "ametista"
       "birlislazzulo"
       "corindone"
       "turchese"
       "ematite"
       "crisocolla"
       "occhio di tigre"
       "quarzo"
       "tormalina"
       "corniola"
       "pirite"
       "sugilite"
       "malachite"
       "quarzo rosa"
       "ossidiana"
       "rubino"
       "agata muschiata"
       "diaspro"
       "ametista"
       "calcedonio"
       "lapislazzulo"
       ].join("\n")
    #name = $resource("/name")
    #$scope.name = name.get()
    #$scope.$watch"word", (value) ->
        #console.log("spelling" + value)
        #updateSpellingStones value

app.service "stoneSpeller", ($http, $timeout, $q) ->
    spell: (stones, word) ->
        deferred = $q.defer()
        $http(
            method: "GET"
            url: "/spellWith"
            params:
                stones: stones
                word: word).success(
                        (data, status) ->
                            console.log("resolved:" + data.join(","))
                            deferred.resolve [capitalize x for x in data].join(",")
                ).error ( -> console.log "ops...")
        deferred.promise

