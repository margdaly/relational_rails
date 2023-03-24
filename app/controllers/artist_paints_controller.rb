class ArtistPaintsController < ApplicationController
  def index
    @artist = Artist.find(params[:id])
    @paints = @artist.paints
  end
end