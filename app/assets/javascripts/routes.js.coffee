define ->
  'use strict'

  # The routes for the application. This module returns a function.
  # `match` is match method of the Router
  (match) ->

    match '', 'home#home'
    match 'marathonmix', 'playlist#index'
    match 'addsong', 'search#index'
    match 'about', 'about#index'
    match 'thanks', 'thanks#index'
    match 'listen', 'listen#index'
    match 'map', 'map#index'

