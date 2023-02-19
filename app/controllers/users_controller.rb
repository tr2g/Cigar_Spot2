class UsersController < ApplicationController

  #ゲストログイン用メソッド
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path(user)
    flash[:guest] = 'ゲストユーザーとしてログインしました'
  end

  def show
    @user = User.find(params[:id])
    # @shops = @user.shops
    # favorites = Favorite.where(user_id: current_user.id).pluck(:shop_id)
    # @favorite_list = Favorite.find(favorites)
  end
end
