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
      return "http://ws.spotify.com/search/1/track.json?q=" + @song

    parse: (resp) ->
      models = []
      resp = resp.tracks[0..9]
      models.push( { 'name' : resp[i].name, 'artist' : resp[i].artists[0].name } ) for i in [0..resp.length-1]
      return models