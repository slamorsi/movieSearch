module = window.movieSearchControllers
if(!module)
  window.movieSearchControllers = module = angular.module('movieSearch.controllers', [])
  
module.controller 'SearchCtrl', ['$scope', '$rootScope', '$route', '$location', '$http', 'query', 'movies', 'favorites', ($scope, $rootScope, $route, $location, $http, query, movies, favorites)->
  $scope.finishedLoading = true
  $scope.movieSearchTitle = query
  $scope.data = {movies: movies || []}
  $scope.favorites = favorites
  $scope.onSearchMovies = ()->

    $scope.finishedLoading = false
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

  $scope.toggleFavorite = (event, movie)->
    event.stopPropagation()
    $target = $(event.target);
    if(!$rootScope.user_signed_in)
      window.location.href = '/signin'
    else
      #bonus show loading
      if($target.hasClass('glyphicon-star-empty'))
        $http.post("/favorites.json", {favorite:{title: movie.Title, imdb_id: movie.imdbID}}).success( (data) ->
          $scope.favorites.push(data)
          $target.removeClass('glyphicon-star-empty').addClass('glyphicon-star')
          console.log('Successfully saved favorite.')
        ).error( ->
          console.error('Failed to save favorite.')
        )
      else
        #todo shouldn't to look up favorite again
        favorite = null
        $scope.favorites.some((f)->
          if(f.imdb_id == movie.imdbID)
            favorite = f
            return true
        )

        if !favorite
          return

        $http.delete("/favorites/" + favorite.id + ".json").success( (data) ->
          $scope.favorites.splice($scope.favorites.indexOf(favorite), 1)
          $target.addClass('glyphicon-star-empty').removeClass('glyphicon-star')
          console.log('Successfully saved favorite.')
        ).error( ->
          console.error('Failed to save favorite.')
        )
]

