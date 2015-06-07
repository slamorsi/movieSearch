module = window.movieSearchControllers
if(!module)
  window.movieSearchControllers = module = angular.module('movieSearch.controllers', [])
  
module.controller 'SearchCtrl', ['$scope', '$route', '$location', 'query', 'movies', ($scope, $route, $location, query, movies)->
  $scope.movieSearchTitle = query
  $scope.data = {movies: movies || []}
  $scope.onSearchMovies = ()->

    if($scope.movieSearchTitle)
      $location.path("/search/movies/"+$scope.movieSearchTitle)
      $route.reload()

  $scope.showMovie = (id)->
    $location.path("/movies/"+id)
]