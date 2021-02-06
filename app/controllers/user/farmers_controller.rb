class User::FarmersController < ApplicationController
  def index
    @farmers = Farmer.all
  end

  def show
    @farmer = Farmer.find(params[:id])
    @reviews = @farmer.reviews.page(params[:page]).per(3).order(id: "DESC")
    @blogs = @farmer.blogs.page(params[:page]).per(3).order(id: "DESC") ## idの降順
    @job_offers = @farmer.job_offers.page(params[:page]).per(5).order(id: "DESC") ## idの降順
    #@title = @farmer.farmer_title

  end

  private

  def farmer_params
    params.require(:farmer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :image, :introduction, :is_valid)
  end
end
