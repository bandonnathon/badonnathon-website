define [
  'chaplin'
  'views/donation_view'
], (Chaplin, DonationView) ->
  'use strict'

  class DonationController extends Chaplin.Controller

    initialize: ->
      @view = new DonationView()

