define [
  'chaplin'
  'views/thanks_view'
], (Chaplin, ThanksView) ->
  'use strict'

  class ThanksController extends Chaplin.Controller
  	
    historyURL: (params) ->
      '/thanks'

    index: ->
      @view = new ThanksView

