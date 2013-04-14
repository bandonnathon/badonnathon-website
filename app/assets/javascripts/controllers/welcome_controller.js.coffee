define [
  'chaplin'
  'views/welcome_view'
], (Chaplin, WelcomeView) ->
  'use strict'

  class WelcomeController extends Chaplin.Controller

    initialize: ->
      @view = new WelcomeView()

