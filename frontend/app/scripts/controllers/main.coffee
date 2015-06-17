'use strict'

###*
 # @ngdoc function
 # @name soundboardApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the soundboardApp
###
angular.module 'soundboardApp'
  .controller 'MainCtrl', ($scope, $location, SoundService) ->

    $scope.loading = true

    SoundService.getSounds().then (dat) ->
      # console.log 'Sounds recieved', dat
      $scope.sounds = dat
      $scope.loading = false

    $scope.play = (id) ->
      console.log 'Sending PLAY command', id
      SoundService.playSound(id)

    $scope.edit = (id) ->
      $location.path '/edit/'+id
