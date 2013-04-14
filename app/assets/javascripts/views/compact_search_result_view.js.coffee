define [
  'chaplin'
  'views/base/view'
], (Chaplin, View) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class CompactSearchResultView extends View

    templateName: 'compact_search_result'

    tagName: 'li'
    className: 'song'

    initialize: ->
      @delegate 'click', "span", @chooseHandler

    chooseHandler: ->
      @model.set({
        donor : mediator.user.get('first_name') + ' ' + mediator.user.get('last_name')
        donorScreen : mediator.user.get('username')
      })
      mediator.publish 'addToPlaylist', @model
      
