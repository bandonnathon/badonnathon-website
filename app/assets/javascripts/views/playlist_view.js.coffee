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
      # Template compilation
      # --------------------

      # This demo uses Handlebars templates to render views.
      # The template is loaded with Require.JS and stored as string on
      # the view prototype. On rendering, it is compiled on the
      # client-side. The compiled template function replaces the string
      # on the view prototype.
      #
      # In the end you might want to precompile the templates to JavaScript
      # functions on the server-side and just load the JavaScript code.
      # Several precompilers create a global JST hash which stores the
      # template functions. You can get the function by the template name:
      #
      # templateFunc = JST[@templateName]

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