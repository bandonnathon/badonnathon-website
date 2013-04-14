define [
  'chaplin'
  'views/layout'
  'routes'
  'controllers/session_controller'
  'controllers/sidebar_controller'
  'controllers/also_controller'
  'controllers/donation_controller'
  'controllers/player_controller'
  'controllers/welcome_controller'
  'controllers/playlist_controller'
  'controllers/search_controller'
  'controllers/about_controller'
  'models/songs'
  # Require base controllers manually because
  # they aren’t compiled individually
  'controllers/home_controller'
], (Chaplin, Layout, routes, SessionController, SidebarController, AlsoController, DonationController, PlayerController, WelcomeController, PlaylistController, SearchController, AboutController, SongsCollection) ->
  'use strict'

  # The application object
  # Choose a meaningful name for your application
  class BadonnathonApplication extends Chaplin.Application

    # Set your application name here so the document title is set to
    # “Controller title – Site title” (see Layout#adjustTitle)
    title: 'Chaplin Example Application'

    initialize: ->
      super
      #console.debug 'HelloWorldApplication#initialize'

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
      new SidebarController()
      new AlsoController()
      new DonationController()
      new PlayerController()
      new WelcomeController()
      new PlaylistController()
      new SearchController()
      new AboutController()
      # These controllers are active during the whole application runtime.
      # You don’t need to instantiate all controllers here, only special
      # controllers which do not to respond to routes. They may govern models
      # and views which are needed the whole time, for example header, footer
      # or navigation views.
      # e.g. new NavigationController()

    # Create additional mediator properties
    # -------------------------------------
    initMediator: ->
      # Create a user property
      Chaplin.mediator.user = null

      # global collection
      Chaplin.mediator.songs = new SongsCollection()
      
      # Add additional application-specific properties and methods
      # Seal the mediator
      Chaplin.mediator.seal()
