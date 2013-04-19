define [
  'chaplin'
  'views/listen_view'
], (Chaplin, ListenView) ->
  'use strict'

  class ListenController extends Chaplin.Controller

    historyURL: (params) ->
      '/listen'

    index: ->
      @view = new ListenView
