module = window.movieSearchControllers
if(!module)
  window.movieSearchControllers = module = angular.module('movieSearch.controllers', [])
  
module.controller 'SearchCtrl', ['$scope', '$rootScope', '$route', '$location', '$http', 'query', 'movies', 'favorites', ($scope, $rootScope, $route, $location, $http, query, movies, favorites)->
  $scope.movieSearchTitle = query
  $scope.data = {movies: movies || []}
  $scope.favorites = favorites
  $scope.onSearchMovies = ()->

    if($scope.movieSearchTitle)
      $location.path("/search/movies/"+$scope.movieSearchTitle)
      $route.reload()

  $scope.showMovie = (id)->
    $location.path("/movies/"+id)


  #bonus extract to service
  $scope.isFavorite = (id)->
    if(!$rootScope.user_signed_in || !favorites || favorites.length == 0)
      return false
    else
      isFavorite = false
      $scope.favorites.some((favorite)->
        if(favorite.imdb_id == id)
          isFavorite = true
          return true
      )

    return isFavorite

  $scope.setFavorite = (event, movie)->
    event.stopPropagation()

    if(!$rootScope.user_signed_in)
      window.location.href = '/signin'
    else
      #bonus show loading
      $http.post("/favorites.json", {favorite:{title: movie.Title, imdb_id: movie.imdbID}}).success( (data) ->
        $scope.favorites.push(data)
        $(event.target).removeClass('glyphicon-star-empty').addClass('glyphicon-star')
        console.log('Successfully saved favorite.')
      ).error( ->
        console.error('Failed to save favorite.')
      )
]

