define [
  'chaplin'
  'views/layout'
  'routes'
  'controllers/session_controller'
  'controllers/playlist_controller'
  'controllers/search_controller'
  'controllers/about_controller'
  'controllers/thanks_controller'
  'models/songs'
  'controllers/home_controller'
  'lib/utils'
], (Chaplin, Layout, routes, SessionController, PlaylistController, SearchController, AboutController, ThanksController, SongsCollection, HomeController, utils) ->
  'use strict'

  # The application object
  # Choose a meaningful name for your application
  class BadonnathonApplication extends Chaplin.Application

    # Set your application name here so the document title is set to
    # “Controller title – Site title” (see Layout#adjustTitle)
    title: 'Chaplin Example Application'

    initialize: ->
      super

      # Initialize core components
      @initDispatcher()
      @initLayout()
      @initMediator()

      # Application-specific scaffold
      @initControllers()

      # Register all routes and start routing
      @initRouter routes
      # You might pass Router/History options as the second parameter.
      # Chaplin enables pushState per default and Backbone uses / as
      # the root per default. You might change that in the options
      # if necessary:
      # @initRouter routes, pushState: false, root: '/subdir/'

      # Freeze the application instance to prevent further changes
      Object.freeze? this

    # Override standard layout initializer
    # ------------------------------------
    initLayout: ->
      # Use an application-specific Layout class. Currently this adds
      # no features to the standard Chaplin Layout, it’s an empty placeholder.
      @layout = new Layout {@title}

    # Instantiate common controllers
    # ------------------------------
    initControllers: ->
      new SessionController()
      
    # Create additional mediator properties
    # -------------------------------------
    initMediator: ->
      # Create a user property
      Chaplin.mediator.user = null

      # global collection
      Chaplin.mediator.songs = new SongsCollection()
      Chaplin.mediator.songs.fetch()
      
      # Add additional application-specific properties and methods
      # Seal the mediator
      Chaplin.mediator.seal()
