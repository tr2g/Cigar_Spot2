class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @shops = @user.shops
    # favorites = Favorite.where(user_id: current_user.id).pluck(:shop_id)
    # @favorite_list = Favorite.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end



  private
    def user_params
      params.require(:user).permit(:name, :profile_image)
    end
end
