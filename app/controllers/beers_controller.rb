class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @beers = Beer.global_search(params[:query])
    else
      @beers = Beer.all
    end
  end

  def show
    @beer = Beer.find(params[:id])
    @order = Order.new
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user_id = current_user.id
    if @beer.save
      redirect_to beer_path(@beer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(beer_params)

    if @beer.save
      redirect_to beer_path(@beer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :degree, :centiliter, :unit_price, :conditionnement, :description, :beer_type, :photo)
  end
end
