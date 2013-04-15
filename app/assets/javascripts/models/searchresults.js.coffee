define [
  'chaplin',
  'models/base/collection',
  'models/song'
], (Chaplin, Collection, Song) ->
  'use strict'

  class SearchResults extends Collection

    # Mix in a SyncMachine
    _.extend @prototype, Chaplin.SyncMachine

    model: Song

    url: ->
      return "/search.json?q=" + @song

    