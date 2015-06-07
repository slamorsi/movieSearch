module = window.movieSearchControllers
if(!module)
  window.movieSearchControllers = module = angular.module('movieSearch.controllers', [])

module.controller 'MovieShowCtrl', ['$scope', 'movie', ($scope, movie)->
  $scope.movie = movie
]