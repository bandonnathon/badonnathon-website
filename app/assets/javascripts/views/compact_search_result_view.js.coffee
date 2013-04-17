define [
  'handlebars'
  'chaplin'
  'views/base/view'
  'text!templates/compact_search_result.hbs'
], (Handlebars, Chaplin, View, template) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class CompactSearchResultView extends View

    tagName: 'li'
    className: 'song'

    initialize: ->
      @delegate 'click', "span", @chooseHandler

    chooseHandler: ->
      try
        donor = mediator.user.get('first_name') + ' ' + mediator.user.get('last_name')
      catch error
        donor = "anon"
        
      @model.set({
        donor : donor
        donorScreen : donor
      })
      mediator.publish 'addToPlaylist', @model
      mediator.publish '!router:route', '/thanks'
      
    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

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