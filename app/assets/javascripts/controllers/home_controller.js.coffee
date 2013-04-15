define [
  'chaplin'
  'models/home'
  'views/home_view'
], (Chaplin, Home, HomeView) ->
  'use strict'

  class HomeController extends Chaplin.Controller

    title: 'Badonnathon'

    historyURL: (params) ->
      '/'

    home: (params) ->
      @model = new Home()
      @view = new HomeView model: @model