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

    $scope.soundname = null
    $scope.soundfile = null
    $scope.mode = null
    sid = $routeParams.id

    if sid?
      $scope.mode = 'edit'
      SoundService.getSound(sid).then (dat) ->
        $scope.soundname = dat.name if dat? and dat.name?
    else
      $scope.mode = 'new'

    $scope.save = ->
      soundfile = if $scope.soundfile isnt null and $scope.soundfile[0]? then $scope.soundfile[0] else null
      soundname = $scope.soundname
      mode = $scope.mode

      unless soundname? and '' != soundname
        $ngBootbox.alert 'Trag einen Namen ein, ohne geht nix...'
        return

      if mode == 'new' and not soundfile?
        $ngBootbox.alert 'Füg noch ein Soundfile hinzu...'
        return

      promiseSoundFile = $q.defer()
      promiseSoundName = $q.defer()

      if soundname?
        if 'edit' == mode
          console.log 'Uploading sound'
          SoundService.updateSoundName(sid, soundname).then ->
            console.log 'Uploading Sound done'
            promiseSoundName.resolve()
        if 'new' == mode
          console.log 'Creating new sound'
          SoundService.createSound(soundname).then (ret) =>
            sid = ret.id if ret.id?
            console.log 'Creating new sound done, new id is', sid
            promiseSoundName.resolve()
      else
        promiseSoundName.resolve()

      promiseSoundName.promise.then ->
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

      promiseSoundFile.promise.then ->
        flash.success = "\"#{soundname}\" gespeichert!"
        $scope.gotoMainPage()

    $scope.gotoMainPage = ->
      $location.path '/'
