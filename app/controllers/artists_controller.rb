class ArtistsController < ApplicationController
  def index
    @artists = Artist.order_by_most_recently_created
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end
end