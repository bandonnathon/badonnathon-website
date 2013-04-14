define [
  'chaplin'
  'views/base/collection_view'
  'views/compact_song_view'
], (Chaplin, CollectionView, CompactSongView) ->
  'use strict'

  class PlaylistView extends CollectionView

    templateName: 'playlist'

    # Automatically append to the DOM on render
    container: '#playlist-container'

    className: 'weeeeee'

    autoRender: true
    renderItems: true
    itemView: CompactSongView

    # Append the item views to this element
    listSelector: 'ol'
    
    # Fallback content selector
    fallbackSelector: '.fallback'
    
    # Loading indicator selector
    loadingSelector: '.loading'