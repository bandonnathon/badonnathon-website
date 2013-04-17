define [
  'handlebars'
  'chaplin'
  'views/base/view'
  'views/login_view'
  'views/player_view'
  'text!templates/home.hbs'
], (Handlebars, Chaplin, View, LoginView, PlayerView, template) ->
  'use strict'

  class HomeView extends View

    className: 'home'

    container: '#wrapper'

    autoRender: true

    initialize: ->
      super
      @subscribeEvent 'loginStatus', @showHideLoginNote
      @fetchTotal()

    fetchTotal: ->
      # get total donations from virgin
      $.getJSON "http://api.jo.je/virginmoneygiving/jsonp.php?d=280684&callback=?", (resp) ->
        percent = parseInt resp['money_target'] * 0.01
        raised = parseInt resp['money_total']
        percentRaised = raised / percent

        $(".donation-total span").text raised
        $(".donation-meter span").css 'width', percentRaised+'%'

    # Show/hide a login appeal if not logged in
    showHideLoginNote: ->
      $('.loginHere').css 'display',
        if Chaplin.mediator.user then 'none' else 'block'

      $('.nologinHere').css 'display',
        if Chaplin.mediator.user then 'block' else 'none'

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