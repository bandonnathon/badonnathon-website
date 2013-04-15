define [
  'chaplin'
  'models/searchresults'
  'views/search_view'
], (Chaplin, SearchResults, SearchView) ->
  'use strict'

  class SearchController extends Chaplin.Controller

    index: ->
      @songs = new SearchResults() # a collection
      @view = new SearchView collection: @songs # a collection view