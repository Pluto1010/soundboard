'use strict'

describe 'Service: SoundService', ->

  # load the service's module
  beforeEach module 'soundboardApp'

  # instantiate service
  SoundService = {}
  beforeEach inject (_SoundService_) ->
    SoundService = _SoundService_

  it 'should do something', ->
    expect(!!SoundService).toBe true
