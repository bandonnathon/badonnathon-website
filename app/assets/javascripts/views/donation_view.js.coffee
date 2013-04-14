define [
  'chaplin'
  'views/base/view'
], (Chaplin, View) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class DonationView extends View

    templateName: 'donation'

    className: 'donation'

    # Automatically append to the DOM on render
    container: '#page-one'
    # Automatically render after initialize
    autoRender: true

    initialize: (options) ->
      super
      #console.debug 'LoginView#initialize', @el, options, options.serviceProviders
      @delegate 'click', "a.money4trax", @donationHandler
      @fetchTotal()


    donationHandler: (e) ->
      e.preventDefault()
      mediator.publish 'addsong'

    fetchTotal: ->
      # get total donations from virgin
      $.getJSON "http://api.jo.je/virginmoneygiving/jsonp.php?d=280684&callback=?", (resp) ->
        percent = parseInt resp['money_target'] * 0.01
        raised = parseInt resp['money_total']
        percentRaised = raised / percent
        total = 100 - percentRaised

        $(".donation-total span").text raised
        $(".donation-meter span").css 'width', total+'%'

