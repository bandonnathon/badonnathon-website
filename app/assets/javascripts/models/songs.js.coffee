define [
  'chaplin',
  'models/base/collection',
  'models/song'
], (Chaplin, Collection, Song) ->
  'use strict'

  class Songs extends Collection

    # Mix in a SyncMachine
    _.extend @prototype, Chaplin.SyncMachine

    model: Song

    url: '/playlist'