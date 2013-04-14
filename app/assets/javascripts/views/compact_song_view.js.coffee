define [
  'views/base/view'
], (View) ->
  'use strict'

  class CompactSongView extends View

    templateName: 'compact_song'

    tagName: 'li'
    className: 'song'
