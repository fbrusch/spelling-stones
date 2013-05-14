app = angular.module "spelling-stones", ['ngResource']

app.controller "MainController", ($scope, $resource, stoneSpeller) ->
    
    $scope.word1 = "cazzo"
    $scope.word2 = "minchia"
    
    $scope.$watch "word1", ->
        $scope.spelledWord1 = stoneSpeller.spell $scope.stones.split("\n"),
                                                 $scope.word1

    $scope.$watch "word2", ->
        $scope.spelledWord2 = stoneSpeller.spell $scope.stones.split("\n"),
                                                 $scope.word2
    

    #updateSpellingStones = (value) ->
        #$scope.spellingStones = stoneSpeller.spell $scope.stones.split("\n"), $scope.name.name


    #$scope.$watch "stones", (value) ->
        #updateSpellingStones value

    
    $scope.stones = ["ametista", "birlislazzulo", "corindone"].join("\n")
    #name = $resource("/name")
    #$scope.name = name.get()
    #$scope.$watch "word", (value) ->
        #console.log("spelling" + value)
        #updateSpellingStones value

app.service "stoneSpeller", ($http, $timeout, $q) ->
    spell: (stones, word) ->
        deferred = $q.defer()
        debugger
        $http(
            method: "GET"
            url: "/spellWith"
            params:
                stones: stones
                word: word).success(
                        (data, status) ->
                            console.log("resolved: " + data.join(","))
                            deferred.resolve "risolto" #data.join(", ")
                ).error ( -> console.log "ops...")
        deferred.promise

