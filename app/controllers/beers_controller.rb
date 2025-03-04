class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def edit
    @beer = Beer.find(params[:id])
  end
  
  def update
    @beer.update(beer_params)
    redirect_to beers_path
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :degree, :centiliter, :unit_price, :conditionnement, :beer_type)
  end
end
