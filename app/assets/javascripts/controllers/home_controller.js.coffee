define [
  'chaplin'
  'models/home'
  'views/home_view'
  'views/player_view'
  'controllers/session_controller'
  'lib/utils'
], (Chaplin, Home, HomeView, PlayerView, SessionController, utils) ->
  'use strict'

  class HomeController extends Chaplin.Controller
    
    title: 'Badonnathon'
      
    historyURL: (params) ->
      '/'

    home: (params) ->
      @model = new Home()
      @view = new HomeView model: @model
      @view.subview 'pv', new PlayerView
        container: @view.$('.player')