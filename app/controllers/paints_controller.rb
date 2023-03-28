class PaintsController < ApplicationController
  def index
    @paints = Paint.high_pressure_true
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

  def destroy
    Paint.destroy(params[:id])
    redirect_to "/paints"
  end

  private
  def paint_params
    params.permit(:name, :brand, :high_pressure, :opacity)
  end
end