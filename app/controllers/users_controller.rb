class UsersController < ApplicationController

  #ゲストログイン用メソッド
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path(user)
    flash[:guest] = 'ゲストユーザーとしてログインしました'
  end

  def show
  end
end
