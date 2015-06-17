'use strict'

###*
 # @ngdoc function
 # @name soundboardApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the soundboardApp
###
angular.module 'soundboardApp'
  .controller 'MainCtrl', ($scope, $location, $ngBootbox, SoundService) ->

    $scope.loading = true

    $scope.loadSounds = ->
      $scope.loading = true
      SoundService.getSounds().then (dat) ->
        # console.log 'Sounds recieved', dat
        $scope.sounds = dat
        $scope.loading = false

    $scope.playSound = (id) ->
      console.log 'Sending PLAY command', id
      SoundService.playSound(id)

    $scope.editSound = (id) ->
      $location.path '/edit/'+id

    $scope.newSound = ->
      $location.path('/new')

    $scope.deleteSound = (id) ->
      SoundService.deleteSound(id).then ->
        $ngBootbox.alert 'Gel&ouml;scht...'
        $scope.loadSounds()

    $scope.deleteAllSounds = ->
      bootbox.dialog
        message: '<img src="images/dickbutt.png" width="575"/>'

    $scope.loadSounds()

