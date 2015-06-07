module = window.movieSearchControllers
if(!module)
  window.movieSearchControllers = module = angular.module('movieSearch.controllers', [])

module.controller 'FavoritesIndexCtrl', ['$scope', 'favorites', ($scope, favorites)->
  
  $scope.favorites = favorites
]