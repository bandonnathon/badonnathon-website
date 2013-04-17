define [
  'chaplin'
  'models/searchresults'
  'views/search_view'
  'controllers/session_controller'
], (Chaplin, SearchResults, SearchView, SessionController) ->
  'use strict'

  class SearchController extends Chaplin.Controller

    index: ->
      @songs = new SearchResults() # a collection
      @view = new SearchView collection: @songs # a collection view