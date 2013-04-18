define [
  'chaplin'
  'views/base/collection_view'
  'models/song'
  'views/compact_search_result_view'
], (Chaplin, CollectionView, Song, CompactSearchResultView) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class SearchView extends CollectionView

    templateName: 'search'

    className: 'search'

    # Automatically append to the DOM on render
    container: '#wrapper'
    
    # Automatically render after initialize
    autoRender: true
    renderItems: true
    itemView: CompactSearchResultView

    # Fallback content selector
    fallbackSelector: '.fallback'
    
    # Loading indicator selector
    loadingSelector: '.loading'

    listSelector: '#results'

    initialize: ->
      super
      @subscribeEvent 'addsong', @show
      @delegate 'focusin', "input[name='song']", @clear
      @delegate 'focusout', "input[name='song']", @populate
      @delegate 'click', ".search-spotify input[type='submit']", @submitHandler
      @subscribeEvent 'addToPlaylist', @addToPlaylist

    addToPlaylist: (model) ->
      mediator.songs.create(new Song( model ) )

    show: ->
      $(@el).show()

    submitHandler: (e) ->
      e.preventDefault()
      @collection.song = $('input[type="text"]').val()
      @collection.fetch()

    clear: ->
      $("input[name='song']").val('')

    populate: ->
      if $("input[name='song']").val().length == 0
        $("input[name='song']").val('Type a song name or artist here')
      
