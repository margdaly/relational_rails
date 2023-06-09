class ArtistPaintsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @paints = @artist.order_by(params[:sort])
  end

  def new
  end

  def create
    artist = Artist.find(params[:artist_id])
    artist.paints.create(artist_paints_params)
    redirect_to "/artists/#{artist.id}/paints"
  end

  private
  def artist_paints_params
    params.permit(:name, :brand, :high_pressure, :opacity)
  end
end