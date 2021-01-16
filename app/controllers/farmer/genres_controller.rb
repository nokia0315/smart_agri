class Farmer::GenresController < ApplicationController
  # before_action :authenticate_administrator!, except: [:show]

  def index
    @genre = Genre.new
    @genres = Genre.all#.page(params[:page]).per(10)
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.farmer = current_farmer
    if @genre.save
      flash[:notice] = "ジャンルを追加しました"
      redirect_to genres_path
    else
      @genres = Genre.all#.page(params[:page]).per(10)
      render :index and return
    end
  end

  def show
    @job_offers = JobOffer.all.all#.page(params[:page]).per(10)
    @genre = Genre.find(params[:id])
    @genres = @genre.job_offers.order(created_at: :desc).all#.page(params[:page]).per(5)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.farmer = current_farmer
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to genres_path
      # if @genre.is_valid == false
      # # @genre.job_offers.each do |job_offer|
      #     job_offer.is_sale = false
      #     job_offer.save
      #   #end
      # end
    else
      render :edit and return
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end
end
