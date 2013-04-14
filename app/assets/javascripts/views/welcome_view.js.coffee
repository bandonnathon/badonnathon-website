define [
  'chaplin'
  'views/base/view'
], (Chaplin, View) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class WelcomeView extends View

    templateName: 'welcome'

    className: 'welcome'

    # Automatically append to the DOM on render
    container: '#page-one'
    # Automatically render after initialize
    autoRender: true

    initialize: (options) ->
      super
      #console.debug 'LoginView#initialize', @el, options, options.serviceProviders
      @delegate 'click', "a.addsong", @addsongHandler

    addsongHandler: (e) ->
      e.preventDefault()

      # Publish a global !logout event
      mediator.publish 'addsong'