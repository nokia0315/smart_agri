class Farmer::FarmersController < ApplicationController
  def index
    @farmer = current_farmer
    @farmers = Farmer.all
  end

  def show
    @farmer = current_farmer
    @blogs = @farmer.blogs.all
    @job_offers = @farmer.job_offers.all
  end

  def edit
    @farmer = current_farmer
  end

  def update
    @farmer = Farmer.find(params[:id])
    @farmer.update(farmer_params)
    redirect_to farmer_path(@farmer.id)
  end

private

  def farmer_params
    params.require(:farmer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :image, :introduction,  :is_valid)
  end
end
