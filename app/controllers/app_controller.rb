class AppController < ApplicationController

  def show
    @fbid = ENV['FACEBOOK_APP_ID'] || "437795012974751"
    render :layout => 'application'
  end

end
