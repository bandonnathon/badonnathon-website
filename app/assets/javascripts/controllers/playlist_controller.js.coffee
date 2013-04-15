define [
  'chaplin'
  'models/song'
  'views/playlist_view'
], (Chaplin, Song, PlaylistView) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator
  
  class PlaylistController extends Chaplin.Controller

    historyURL: (params) ->
      '/playlist'

    initialize: ->
      @subscribeEvent 'addToPlaylist', @addToPlaylist

    index: ->
      @view = new PlaylistView collection: mediator.songs # a collection view
      @view.showHideLoginNote()

    addToPlaylist: (model) ->
      mediator.songs.create(new Song( model ) )