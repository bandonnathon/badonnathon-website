define [
  'chaplin'
  'views/about_view'
], (Chaplin, AboutView) ->
  'use strict'

  class AboutController extends Chaplin.Controller

    initialize: ->
      @view = new AboutView()

