define [
  'chaplin'  
  'views/playlist_view'
], (Chaplin, PlaylistView) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator
  
  class PlaylistController extends Chaplin.Controller

    historyURL: (params) ->
      '/playlist'

    index: ->
      @view = new PlaylistView collection: mediator.songs # a collection view
      @view.showHideLoginNote()