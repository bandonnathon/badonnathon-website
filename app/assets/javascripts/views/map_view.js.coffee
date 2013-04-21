define [
  'handlebars'
  'chaplin'
  'views/base/view'
  'text!templates/map.hbs'
], (Handlebars, Chaplin, View, template) ->

  'use strict'

  class ListenView extends View

    container: '#wrapper'

    className: 'plist'

    autoRender: true

    render: ->
      super
      $('.home').remove()
      @$('#playlist-canvas').append('<iframe src="https://embed.spotify.com/?uri=spotify:user:paul.carvill:playlist:5cO2C8jfCykbXzb84Eheea" width="320" height="90" frameborder="0" allowtransparency="true"></iframe>')

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