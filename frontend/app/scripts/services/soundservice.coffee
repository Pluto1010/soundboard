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
      saveSound: (sound) ->
        deferred = $q.defer()

        unless sound.id? and sound.name?
          deferred.reject('No id or name given')

        sound.put().then (asd) ->
          deferred.resolve()

        return deferred.promise
    }
