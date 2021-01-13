class Farmer::JobOffersController < ApplicationController
  def top
    now = Time.current
    @orders = Order.where(created_at: now.all_day)
  end

  def new
    @job_offer = JobOffer.new
    # @genres = Genre.all
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
     if @job_offer.save
       redirect_to job_offer_path(@job_offer)
     else
       render:new
     end
  end

  def index
    @job_offers = JobOffer.all
  end

  def show
   @job_offer = JobOffer.find(params[:id])
  end

  def edit
    @job_offer = JobOffer.find(params[:id])
    # @genres = Genre.all
  end

  def update
    job_offer = JobOffer.find(params[:id])
    job_offer.update(job_offer_params)
    redirect_to job_offers_path
  end

  def destroy
    job_offer = JobOffer.find(params[:id])
    job_offer.destroy
    redirect_to job_offers_path
  end

  private
  def job_offer_params
    params.require(:job_offer).permit(:title, :explanation, :reward, :is_valid, :image_id, :genre_id)
    # permitに記述している内容しか変更できない様にするため
  end

end
