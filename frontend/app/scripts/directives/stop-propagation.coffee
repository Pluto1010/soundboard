'use strict'

###*
 # @ngdoc directive
 # @name soundboardApp.directive:stopPropagation
 # @description
 # # stopPropagation
###
angular.module 'soundboardApp'
  .directive 'stopPropagation', ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      element.bind 'click', (e) ->
        e.stopPropagation()
