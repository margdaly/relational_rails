class ArtistPaintsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @paints = @artist.paints
  end
end