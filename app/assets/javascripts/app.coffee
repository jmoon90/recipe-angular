
  recipe = angular.module('recipe',[
    'templates',
    'ngRoute',
    'controllers',
  ])

  recipe.config([ '$routeProvider',
    ($routeProvider)->
      $routeProvider
        .when('/',
          templateUrl: "index.html"
          controller: 'RecipesController'
        )
  ])

  recetas = [
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
  controllers = angular.module('controllers',[])
  controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location',
    ($scope,$routeParams,$location)->
      $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

      if $routeParams.keywords
        keywords = $routeParams.keywords.toLowerCase()
        $scope.recetas = recetas.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
      else
        $scope.recetas = []
  ])
