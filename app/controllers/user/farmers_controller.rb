class User::FarmersController < ApplicationController
  def index
    @farmers = Farmer.all
  end

  def show
    @farmer = Farmer.find(params[:id])
    @reviews = @farmer.reviews.page(params[:page]).per(5)
    @blogs = @farmer.blogs.all
    @job_offers = @farmer.job_offers.all
  end

  private

  def farmer_params
    params.require(:farmer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :image, :introduction, :is_valid)
  end
end
