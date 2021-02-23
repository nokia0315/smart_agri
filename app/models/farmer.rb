class Farmer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_offers, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :reviews, dependent: :destroy
  attachment :image

  def farmer_title
    farmer_avg_score = self.reviews.average(:score).round(2)
    if farmer_avg_score >= 0.7
      return "ゴールドファーマー"
    elsif farmer_avg_score >= 0.5
      return "シルバーファーマー"
    else
      return "ノーマル"
    end
  end
end
