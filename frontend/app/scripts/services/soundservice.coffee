'use strict'

###*
 # @ngdoc service
 # @name soundboardApp.SoundService
 # @description
 # # SoundService
 # Service in the soundboardApp.
###
angular.module 'soundboardApp'
  .service 'SoundService', (Restangular) ->
    sounds = Restangular.one('sounds')

    return {
      getSounds: ->
        return sounds.getList()
      playSound: (id) ->
        return Restangular.one('sounds', id).one('play').get()
    }
