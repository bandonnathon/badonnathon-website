define [
  'chaplin',
  'views/base/view',
], (Chaplin, View) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class PlayerView extends View

    template: template
    template = null

    className: 'player'

    # Automatically append to the DOM on render
    container: '#page-one'
    # Automatically render after initialize
    autoRender: true

    initialize: (options) ->
      super
      #console.debug 'LoginView#initialize', @el, options, options.serviceProviders
      @delegate 'click', "a.playlist", @playlistHandler

    playlistHandler: (e) ->
      e.preventDefault()

      # Publish a global !logout event
      mediator.publish 'playlist'
      mediator.publish 'flip'