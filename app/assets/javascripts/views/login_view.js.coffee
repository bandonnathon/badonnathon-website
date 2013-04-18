define [
  'underscore'
  'handlebars'
  'chaplin'
  'views/base/view'
  'text!templates/login.hbs'
], (_, Handlebars, Chaplin, View, template) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class LoginView extends View

    container: '.loginHere'
    
    autoRender: true

    # Expects the serviceProviders in the options
    initialize: (options) ->
      super
      @initButtons options.serviceProviders


    # In this project we currently only have one service provider and therefore
    # one button. But this should allow for different service providers.
    initButtons: (serviceProviders) ->
      #console.debug 'LoginView#initButtons', serviceProviders

      for serviceProviderName, serviceProvider of serviceProviders

        buttonSelector = ".#{serviceProviderName}"
        @$(buttonSelector).addClass('service-loading')

        loginHandler = _(@loginWith).bind(
          this, serviceProviderName, serviceProvider
        )
        @delegate 'click', buttonSelector, loginHandler

        loaded = _(@serviceProviderLoaded).bind(
          this, serviceProviderName, serviceProvider
        )
        serviceProvider.done loaded

        failed = _(@serviceProviderFailed).bind(
          this, serviceProviderName, serviceProvider
        )
        serviceProvider.fail failed

    loginWith: (serviceProviderName, serviceProvider, e) ->
      e.preventDefault()
      return unless serviceProvider.isLoaded()
      mediator.publish 'login:pickService', serviceProviderName
      mediator.publish '!login', serviceProviderName

    serviceProviderLoaded: (serviceProviderName) ->
      @$(".#{serviceProviderName}").removeClass('service-loading')

    serviceProviderFailed: (serviceProviderName) ->
      #console.debug 'LoginView#serviceProviderFailed', serviceProviderName
      @$(".#{serviceProviderName}")
        .removeClass('service-loading')
        .addClass('service-unavailable')
        .attr('disabled', true)
        .attr('title',
          'Error connecting. Please check whether you are blocking ' +
          "#{utils.upcase(serviceProviderName)}."
        )

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