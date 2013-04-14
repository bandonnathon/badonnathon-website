define [
  'chaplin'
  'views/base/collection_view'
  'views/compact_search_result_view'
], (Chaplin, CollectionView, CompactSearchResultView) ->
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

    listSelector: '#results'

    initialize: ->
      super

      @subscribeEvent 'loginStatus', @showHideLoginNote
      @subscribeEvent 'addsong', @show
      @delegate 'click', "a.close", @close
      @delegate 'click', ".search-spotify input[type='submit']", @submitHandler

    # Show/hide a login appeal if not logged in
    showHideLoginNote: ->

      @$('.showLogin').css 'display',
        if Chaplin.mediator.user then 'none' else 'block'

      @$('.showSearch').css 'display',
        if Chaplin.mediator.user then 'block' else 'none'

    show: ->
      $(@el).show()

    close: ->
      mediator.publish 'removeaddsong'
      $(@el).hide();

    submitHandler: (e) ->
      e.preventDefault()

      @collection.song = $('input[type="text"]').val()
      @collection.fetch()


