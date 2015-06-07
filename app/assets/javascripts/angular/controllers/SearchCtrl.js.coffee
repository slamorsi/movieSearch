angular.module('movieSearch.controllers', []).controller 'SearchCtrl', ['$scope', 'MOVIE_API', '$http', ($scope, MOVIE_API, $http)->
  $scope.movieSearchTitle = ''
  $scope.data = {movies: []}
  $scope.onSearchMovies = ()->

    if($scope.movieSearchTitle)
      $http.get(MOVIE_API+"s="+$scope.movieSearchTitle).success( (data) ->
        #Title, Type, Year, imdbID
        $scope.data.movies = data.Search
        console.log('Successfully loaded movie.')
      ).error( ->
        console.error('Failed to load movies.')
        #bonus show in UI
      )
]