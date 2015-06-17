'use strict'

###*
 # @ngdoc service
 # @name soundboardApp.SoundService
 # @description
 # # SoundService
 # Service in the soundboardApp.
###
angular.module 'soundboardApp'
  .service 'SoundService', ($q, Restangular) ->
    return {
      getSounds: ->
        return Restangular.one('sounds').getList()
      playSound: (id) ->
        return Restangular.one('sounds', id).one('play').get()
      getSound: (id) ->
        return Restangular.one('sounds', id).get()
      getSaveUrl: (id) ->
        return Restangular.one('sounds', id).getRequestedUrl()
      updateSoundName: (id, name) ->
        return Restangular.one('sounds', id).customPUT({'sound': {'name': name}})
      createSound: (name) ->
        return Restangular.one('sounds').customPOST({'sound': {'name': name}})
      deleteSound: (id) ->
        return Restangular.one('sounds', id).remove()
    }
