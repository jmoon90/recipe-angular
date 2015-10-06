recipe = angular.module('recipe', [
  'templates',
  'ngRoute',
  'controllers',
])

recipe.config(['$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: 'index.html'
        controller: 'RecipesController'
      )
])

recipes = [
  {
    id: 1
    name: 'Baked Potato w/ Cheese'
  },
  {
    id: 2
    name: 'Garlic Mashed Potatoes',
  },
  {
    id: 3
    name: 'Potatoes Au Gratin',
  },
  {
    id: 4
    name: 'Baked Brussel Sprouts',
  },
]

recipeController = angular.module('controllers', [])
recipeController.controller("RecipesController", ['$scope', '$routeParams', '$location',
  ($scope, $routeParams, $location)->

    $scope.search = (keywords)-> $location.path("/").search('keywords', keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerase()
      $scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keyowrds) != -1
    else
      $scope.recipes = []

])

