#= require hamlcoffee
#= require_tree ./templates

# Bootstrap the application
require [
  'badonnathon_application'
], (BadonnathonApplication) ->
  'use strict'

  app = new BadonnathonApplication()
  app.initialize()
