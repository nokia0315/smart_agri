class User::JobOffersController < ApplicationController
  def top
  end

  def about
  end

  def index
        @genres = Genre.all
        @job_offers = JobOffer.all

        # def search
        #   @value = params["search"]["value"]         #データを代入
        #   @how = params["search"]["how"]             #データを代入
        #   @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
        # end
  end

  def show
      @job_offers = JobOffer.all
      @job_offer = JobOffer.find(params[:id])
      @genres = Genre.all
  end

	 private

    	def job_offer_params
    		parmas.require(:job_offer).permit(:image_id, :explanation, :title, :is_valid, :farmer_id, :reward, )
    	end

      def farmer_params
        params.require(:farmer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :is_valid)
      end
end
