define [
  'views/base/view'
], (View) ->
  'use strict'

  class AboutView extends View

    templateName: 'about'

    className: 'about'

    # Automatically append to the DOM on render
    container: '#page-one'
    # Automatically render after initialize
    
    autoRender: false