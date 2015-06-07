module = window.movieSearchControllers
if(!module)
  window.movieSearchControllers = module = angular.module('movieSearch.controllers', [])

module.controller 'FavoritesIndexCtrl', ['$scope', '$rootScope', '$location', '$http', 'favorites', ($scope, $rootScope, $location, $http, favorites)->
  
  $scope.favorites = favorites

  $scope.showMovie = (id)->
    $location.path("/movies/"+id)

  $scope.toggleFavorite = (event, favorite)->
    event.stopPropagation()
    $target = $(event.target);
    if(!$rootScope.user_signed_in)
      window.location.href = '/signin'
    else
      #bonus show loading

      $http.delete("/favorites/" + favorite.id + ".json").success( (data) ->
        $scope.favorites.splice($scope.favorites.indexOf(favorite), 1)
        console.log('Successfully saved favorite.')
      ).error( ->
        console.error('Failed to save favorite.')
      )
]