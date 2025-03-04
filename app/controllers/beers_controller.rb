class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @beers = Beer.all
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(beer_params)
    redirect_to beer_path(@beer)
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :degree, :centiliter, :unit_price, :conditionnement, :beer_type)
  end
end
