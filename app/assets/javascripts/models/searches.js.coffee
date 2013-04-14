define [
  'chaplin',
  'models/base/collection',
  'models/song'
], (Chaplin, Collection, Song) ->
  'use strict'

class Searches extends Collection

  # Mix in a SyncMachine
  _.extend @prototype, Chaplin.SyncMachine

  model: Song

  url: ->
    return "/search.json?song=" + this.song