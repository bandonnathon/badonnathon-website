define [
  'models/base/model'
], (Model) ->
  'use strict'

  class Home extends Model

    defaults:
      message: 'home'