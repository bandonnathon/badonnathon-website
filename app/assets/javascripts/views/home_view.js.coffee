define [
  'views/base/view'
], (View) ->
  'use strict'

  class HomeView extends View

    templateName: 'home'

    # Automatically append to the DOM on render
    container: '#page-one'

    # Automatically render after initialize
    autoRender: true

    state: 'front'

    initialize: ->
      super

      @subscribeEvent 'flip', @flipHandler
      @subscribeEvent 'addsong', @hide
      @subscribeEvent 'removeaddsong', @show
      

    hide: -> 
      $('.flipContainer').hide();

    show: -> 
      $('.flipContainer').show();

    flipHandler: ->

      # apply flip classes to page-one and page-two
      if @state == "front"
        @state = 'back'
        $('.flipContainer').addClass('flipped');
      else
        @state = 'front'
        $('.flipContainer').removeClass('flipped');

    ### 

    $.when(App.homePage.fetch()).done(function() {
      new HomePageView({
        model: App.homePage
      }).render();
    });

    $.when(App.playlist.fetch()).done(function() {
        new PlaylistView({
            collection: App.playlist
        }).render();
    });

    if(state === "playlist") {
        this.$el.find('.flipContainer').addClass('flipped');
    } else {
        this.$el.find('.flipContainer').removeClass('flipped');
    }

    ###