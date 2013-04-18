define [
  'handlebars'
  'chaplin'
  'views/base/view'
  'text!templates/player.hbs'
], (Handlebars, Chaplin, View, template) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class PlayerView extends View
    
    autoRender: true

    initialize: (options) ->
      super
      mediator.songs.bind 'reset', @showLatest

    showLatest: (collection) ->
      @model =  collection.at(collection.length-1)
      $('.latestSong').append('<iframe src="https://embed.spotify.com/?uri='+@model.get('href')+'" width="100%" height="80" frameborder="0" allowtransparency="true"></iframe>')
      $('.latestDonor span').text(@model.get('donor'))
    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

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