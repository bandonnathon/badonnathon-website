define [
  'chaplin'
  'views/map_view'
], (Chaplin, MapView) ->
  'use strict'

  class MapController extends Chaplin.Controller

    historyURL: (params) ->
      '/map'

    index: ->
      @view = new MapView
