define [
  'handlebars'
  'chaplin'
  'views/base/collection_view'
  'views/playlist_view'
  'views/compact_song_view'
  'text!templates/playlist.hbs'
], (Handlebars, Chaplin, CollectionView, PlaylistView, CompactSongView, template) ->

  'use strict'

  class PlaylistView extends CollectionView

    # Automatically append to the DOM on render
    container: '#wrapper'

    className: 'plist'

    autoRender: true
    renderItems: true
    itemView: CompactSongView

    initialize: ->
      super
      @subscribeEvent 'loginStatus', @showHideLoginNote

    # Show/hide a login appeal if not logged in
    showHideLoginNote: ->
      $('.loginHere').css 'display',
        if Chaplin.mediator.user then 'none' else 'block'

      $('.nologinHere').css 'display',
        if Chaplin.mediator.user then 'block' else 'none'

    # Append the item views to this element
    listSelector: 'ul'

    getTemplateFunction: ->
      template = @template

      if typeof template is 'string'
        # Compile the template string to a function and save it
        # on the prototype. This is a workaround since an instance
        # shouldn’t change its prototype normally.
        templateFunc = Handlebars.compile template
        @constructor::template = templateFunc
      else
        templateFunc = template

      templateFunc

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null