class ArtistsController < ApplicationController
  def index
    @artists = Artist.order_by_most_recently_created
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end

  def create
    Artist.create(artist_params)
    redirect_to '/artists'
  end

  private
  def artist_params
    params.permit(:name, :sponsored, :rank)
  end
end