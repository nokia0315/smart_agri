class User::ReviewsController < ApplicationController
  def new
  end

  def show
    @review = Review.find(params[:id])
    @farmer = @review.farmer
  end

  def create
    farmer = Farmer.find(params[:users_farmer_id])
    review = current_user.reviews.new(review_params)
    review.farmer_id = farmer.id
    review.save
    redirect_to users_farmer_review_path(users_farmer_id: farmer.id, id: review.id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
     flash[:success] = "レビュー内容をを変更しました"
     redirect_to users_farmer_review_path(review)
    else
     render :edit
    end
  end

  def destroy
    Review.find_by(id: params[:id], farmer_id: params[:users_farmer_id]).destroy
    redirect_to users_farmer_path(params[:users_farmer_id])
  end

  private
    def review_params
      params.require(:review).permit(:title, :rate, :image_id, :explanation, :farmer_id, :user_id)
    end
end
