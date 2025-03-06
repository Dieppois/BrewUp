class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    redirect_to beer_path(@user.beers), status: :see_other
  end
end
