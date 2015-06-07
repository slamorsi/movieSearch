module = window.movieSearchControllers
if(!module)
  window.movieSearchControllers = module = angular.module('movieSearch.controllers', [])

module.controller 'MovieShowCtrl', ['$scope', 'movie', ($scope, movie)->

  #sample:{"Title":"Test","Year":"2013","Rated":"N/A","Released":"4 Apr 2014","Runtime":"89 min","Genre":"Drama","Director":"Chris Mason Johnson","Writer":"Chris Mason Johnson (screenplay)","Actors":"Scott Marlowe, Matthew Risch, Evan Boomer, Kevin Clarke","Plot":"San Francisco, 1985: Frankie confronts the challenges of being an understudy in a modern dance company as he embarks on a budding relationship with Todd, a veteran dancer in the same ...","Language":"English","Country":"USA","Awards":"3 wins & 2 nominations.","Poster":"http://ia.media-imdb.com/images/M/MV5BMTQwMDU5NDkxNF5BMl5BanBnXkFtZTcwMjk5OTk4OQ@@._V1_SX300.jpg","Metascore":"70","imdbRating":"6.5","imdbVotes":"678","imdbID":"tt2407380","Type":"movie","Response":"True"}
  
  $scope.movie = movie
]