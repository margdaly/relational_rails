class PaintsController < ApplicationController
  def index
    @paints = Paint.all
  end

  def show
    @paint = Paint.find(params[:id])
  end

  def edit
    @paint = Paint.find(params[:id])
  end

  def update
    paint = Paint.find(params[:id])
    paint.update(paint_params)
    paint.save
    redirect_to "/paints/#{paint.id}"
  end

  private
  def paint_params
    params.permit(:name, :brand, :high_pressure, :opacity)
  end
end