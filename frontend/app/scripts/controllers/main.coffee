'use strict'

###*
 # @ngdoc function
 # @name soundboardApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the soundboardApp
###
angular.module 'soundboardApp'
  .controller 'MainCtrl', ($scope, SoundService) ->

    SoundService.getSounds().then (dat) ->
      console.log 'Sounds recieved', dat
      $scope.sounds = dat

    $scope.playSound = (id) ->
      console.log 'Sending PLAY command', id
      SoundService.playSound(id)
