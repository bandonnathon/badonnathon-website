define [
  'handlebars'
  'chaplin'
  'views/base/view'
  'text!templates/listen.hbs'
], (Handlebars, Chaplin, View, template) ->

  'use strict'

  class ListenView extends View

    container: '#wrapper'

    className: 'plist'

    autoRender: true

    initialize: (options) ->
      super
      Chaplin.mediator.songs.bind 'reset', @show

    show: (collection) ->
      models = collection.models.map (x) -> x.get('href').split(':')[2]
    
      models = models.join()
    
      $('#listen').append('<iframe src="https://embed.spotify.com/?uri=spotify:trackset:BADONNATHON:'+models+'" width="350px" height="430" frameborder="0" allowtransparency="true"></iframe>')

    getTemplateFunction: ->
      template = @template

      if typeof template is 'string'
        templateFunc = Handlebars.compile template
        @constructor::template = templateFunc
      else
        templateFunc = template

      templateFunc

    template: template
    template = null