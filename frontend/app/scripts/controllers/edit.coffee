'use strict'

###*
 # @ngdoc function
 # @name soundboardApp.controller:EditCtrl
 # @description
 # # EditCtrl
 # Controller of the soundboardApp
###
angular.module 'soundboardApp'
  .controller 'EditCtrl', ($scope, $location, $routeParams, flash, SoundService) ->

    sid = $routeParams.id

    SoundService.getSound(sid).then (dat) ->
      $scope.sound = dat if dat?

    $scope.save = ->
      SoundService.saveSound($scope.sound).then (dat) ->
        flash.success = "\"#{$scope.sound.name}\" gespeichert!"
        $location.path '/'
      , (err) ->
        flash.error = "\"#{$scope.sound.name}\" konnte nicht gespeichert werden!"
        $location.path '/'
    $scope.goBack = ->
      $location.path '/'
