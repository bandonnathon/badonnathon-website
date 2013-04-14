define [
  'views/base/view',
], (View) ->
  'use strict'

  class AlsoView extends View

    templateName: 'also'

    className: 'also'

    # Automatically append to the DOM on render
    container: '#page-one'
    # Automatically render after initialize
    autoRender: true