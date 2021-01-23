class User::FavosController < ApplicationController
  def create
    job_offer = JobOffer.find(params[:users_job_offer_id])
    favo = current_user.favos.new(job_offer_id: job_offer.id)
    favo.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    job_offer = JobOffer.find(params[:users_job_offer_id])
    favo = current_user.favos.find_by(job_offer_id: job_offer.id)
    favo.destroy
    redirect_back(fallback_location: root_path)
  end
end
