define [
  'handlebars'
  'chaplin'
  'views/base/view'
  'text!templates/about.hbs'
], (Handlebars, Chaplin, View, template) ->
	
  'use strict'

  class AboutView extends View

    className: 'about'

    container: '#wrapper'
    
    autoRender: true

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