define [
  'chaplin'
  'models/about'
  'views/about_view'
], (Chaplin, About, AboutView) ->
  'use strict'

  class AboutController extends Chaplin.Controller

    historyURL: (params) ->
      '/'

    index: ->
      @model = new About()
      @view = new AboutView model: @model

