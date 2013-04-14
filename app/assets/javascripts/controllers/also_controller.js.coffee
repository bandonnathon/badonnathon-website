define [
  'chaplin'
  'views/also_view'
], (Chaplin, AlsoView) ->
  'use strict'

  class AlsoController extends Chaplin.Controller

    initialize: ->
      @view = new AlsoView()

