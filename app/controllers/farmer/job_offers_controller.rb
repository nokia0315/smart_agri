class Farmer::JobOffersController < ApplicationController
  before_action :authenticate_farmer!

  def top

  end

  def new
    @job_offer = JobOffer.new
    @genres = Genre.all
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    @job_offer.farmer = current_farmer
    if @job_offer.save!
      flash[:notice] = "新規求人を登録しました"
      redirect_to farmers_job_offer_path(@job_offer)
    else
      render :new
    end
  end

  def index
    @genres = Genre.all
    @job_offers = JobOffer.page(params[:page]).per(5)
    @all_ranks = JobOffer.find(Favo.group(:job_offer_id).order('count(job_offer_id) desc').limit(3).pluck(:job_offer_id))
  end

  def show
    @job_offer = JobOffer.find(params[:id])
  end

  def edit
    @job_offer = JobOffer.find(params[:id])
    @genres = Genre.all
  end

  def update
    job_offer = JobOffer.find(params[:id])
    if job_offer.update(job_offer_params)
      flash[:success] = "求人内容をを変更しました"
      redirect_to farmers_job_offers_path
    else
      render :edit
    end
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
