class User::JobOffersController < ApplicationController
  def top
  end

  def about
  end

  def index
    @genres = Genre.all
    @job_offers = JobOffer.page(params[:page]).per(5)
    @all_ranks = JobOffer.find(Favo.group(:job_offer_id).order('count(job_offer_id) desc').limit(3).pluck(:job_offer_id))
  end

  def show
    @job_offers = JobOffer.all
    @job_offer = JobOffer.find(params[:id])
    @genres = Genre.all
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:image_id, :explanation, :title, :is_valid, :farmer_id, :reward,)
  end

  def farmer_params
    params.require(:farmer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :is_valid)
  end
end
