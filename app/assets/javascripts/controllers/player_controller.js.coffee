define [
  'chaplin'
  'views/player_view'
], (Chaplin, PlayerView) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class PlayerController extends Chaplin.Controller

    initialize: ->
      @view = new PlayerView collection: mediator.songs

