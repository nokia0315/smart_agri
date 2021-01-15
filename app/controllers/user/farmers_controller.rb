class User::FarmersController < ApplicationController
  def index
    @farmers = Farmer.all
  end

  def show
    @farmer = Farmer.find(params[:id])
    @blogs = @farmer.blogs.all
  end

  private

  def farmer_params
    params.require(:farmer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :is_valid)
  end
end
