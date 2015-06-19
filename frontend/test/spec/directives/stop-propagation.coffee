'use strict'

describe 'Directive: stopPropagation', ->

  # load the directive's module
  beforeEach module 'soundboardApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<stop-propagation></stop-propagation>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the stopPropagation directive'
