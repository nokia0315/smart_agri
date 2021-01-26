class User::UsersController < ApplicationController
  def show
    @user = current_user
    @favos = Favo.where(user_id: @user.id).page(params[:page]).per(5)
    # @user = user.find(params[:id])
  end

  def quit
  end

  def out
    @user = current_user
    @user.update(is_valid: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit
    @user = current_user
    # @user = user.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :image, :introduction, :is_valid)
  end
end
