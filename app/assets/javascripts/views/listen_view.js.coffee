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
      
      $('#listen').append('<iframe src="https://embed.spotify.com/?uri=spotify:user:paul.carvill:playlist:5cO2C8jfCykbXzb84Eheea" width="350" height="430" frameborder="0" allowtransparency="true"></iframe>')

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