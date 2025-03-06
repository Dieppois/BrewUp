class OrdersController < ApplicationController
  before_action :set_beer, only: %i[create]

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.beer = @beer
    @order.user = current_user
    if @order.save
      redirect_to beer_order_path(@beer, @order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_beer
    @beer = Beer.find(params[:beer_id])
  end

  def order_params
    params.require(:order).permit(:quantity, :beer_id)
  end
end
