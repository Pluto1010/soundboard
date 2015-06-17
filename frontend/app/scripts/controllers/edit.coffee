'use strict'

###*
 # @ngdoc function
 # @name soundboardApp.controller:EditCtrl
 # @description
 # # EditCtrl
 # Controller of the soundboardApp
###
angular.module 'soundboardApp'
  .controller 'EditCtrl', ($scope, $location, $routeParams, $q, $ngBootbox, flash, Upload, SoundService, $window) ->

    sid = $routeParams.id
    $scope.soundname = null
    $scope.soundfile = null

    SoundService.getSound(sid).then (dat) ->
      $scope.soundname = dat.name if dat? and dat.name?

    $scope.save = ->

      soundfile = if $scope.soundfile isnt null and $scope.soundfile[0]? then $scope.soundfile[0] else null
      soundname = $scope.soundname

      unless soundname?
        $ngBootbox.alert 'Trag einen Namen ein, ohne geht nix...'
        return

      promiseSoundFile = $q.defer()
      promiseSoundName = $q.defer()

      if soundname?
        console.log 'Uploading Sound'
        SoundService.saveSoundName(sid, soundname).then ->
          console.log 'Uploading Sound done'
          promiseSoundName.resolve()
      else
        promiseSoundName.resolve()

      if soundfile?
        console.log 'Uploading File'
        # @todo Have to figure out how to send name in same request as file...
        # "data" parameter somehow doesn't do the trick
        # https://github.com/danialfarid/ng-file-upload#usage
        # https://github.com/danialfarid/ng-file-upload/wiki/Rails-Example
        Upload.upload(
          url: SoundService.getSaveUrl(sid)
          method: 'PUT'
          file: soundfile
          fileFormDataName: 'sound[soundfile]'
        ).success (data, status, headers, config) ->
          console.log 'Uploading File done'
          promiseSoundFile.resolve()
      else
        promiseSoundFile.resolve()

      $q.all([promiseSoundFile.promise, promiseSoundName.promise]).then ->
        flash.success = "\"#{soundname}\" gespeichert!"
        $scope.gotoMainPage()

    $scope.gotoMainPage = ->
      $location.path '/'
