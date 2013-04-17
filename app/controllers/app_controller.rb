require 'open-uri'
require 'json'

class AppController < ApplicationController

  def show
    @fbid = ENV['FACEBOOK_APP_ID'] || "437795012974751"
    render :layout => 'application'
  end

  def search
      song = params[:q]
      songs = []
      j = open("http://ws.spotify.com/search/1/track.json?q=#{URI.encode(song)}").read
      data = JSON.parse(j);

      data['tracks'].take(75).map do |track|
        songs << {
          :name => track['name'],
          :track => track['album']['name'],
          :href =>track['href'],
          :artist => track['artists'][0]['name']
        }
      end

      render :json => songs.to_json
  end

end
