module = window.movieSearchControllers
if(!module)
  window.movieSearchControllers = module = angular.module('movieSearch.controllers', [])
  
module.controller 'SearchCtrl', ['$scope', 'MOVIE_API', '$http', '$location', '$rootScope', ($scope, MOVIE_API, $http, $location, $rootScope)->
  $scope.movieSearchTitle = ''
  $scope.data = {movies: []}
  $scope.onSearchMovies = ()->

    if($scope.movieSearchTitle)
      $http.get(MOVIE_API+"s="+$scope.movieSearchTitle).success( (data) ->
        #Title, Type, Year, imdbID
        $scope.data.movies = data.Search
        console.log('Successfully loaded movies.')
      ).error( ->
        console.error('Failed to load movies.')
        #bonus show in UI
      )

  $scope.showMovie = (id)->
    $location.path("/movies/"+id)
]