class PlaylistController < ApplicationController

  def index
    @songs = Song.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @songs}
    end
  end

  def add
  	@user = Song.new(:name => params[:name], :artist => params[:artist], :donor => params[:donor], :donorScreen => params[:donorScreen], :href => params[:href], :fbid => params[:fbid])
  	if @user.save!
  		@msg = "saved"
  	else
  		@msg = "not saved"
  	end
  end

  def search
    @songs = Song.all
    respond_to do |format|
      format.json { render :json => @songs}
    end
  end
end
