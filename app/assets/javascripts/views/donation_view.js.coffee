define [
  'handlebars'
  'chaplin'
  'views/base/view'
  'text!templates/donation.hbs'
], (Handlebars, Chaplin, View, template) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class DonationView extends View

    container: '.donation'

    autoRender: true

    initialize: (options) ->
      super
      #@fetchTotal()

    fetchTotal: ->
      # get total donations from virgin
      $.getJSON "http://api.jo.je/virginmoneygiving/jsonp.php?d=280684&callback=?", (resp) ->
        percent = parseInt resp['money_target'] * 0.01
        raised = parseInt resp['money_total']
        percentRaised = raised / percent
        total = 100 - percentRaised

        $(".donation-total span").text raised
        $(".donation-meter span").css 'width', total+'%'

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