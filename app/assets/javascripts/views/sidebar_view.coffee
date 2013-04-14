define [
  'chaplin'
  'views/base/view'
], (Chaplin, View) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class SidebarView extends View

    templateName: 'sidebar'

    id: 'sidebar'
    # Automatically append to the DOM on render
    container: '#playlist-container'
    # Automatically render after initialize
    autoRender: true

    initialize: ->
      super

      @subscribeEvent 'loginStatus', @loginStatusHandler
      @subscribeEvent 'userData', @render

      @delegate 'click', '#logout-button', @logoutButtonClick

    loginStatusHandler: (loggedIn) =>
      #console.debug 'SidebarView#loginStatusHandler', loggedIn
      if loggedIn
        @model = mediator.user
      else
        @model = null
      @render()

    # Handle clicks on the logout button
    logoutButtonClick: (event) ->
      event.preventDefault()
      # Publish a global !logout event
      mediator.publish '!logout'
