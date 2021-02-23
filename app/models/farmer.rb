class Farmer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_offers, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # # 自分がフォローされる（被フォロー）側の関係性
  # has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # # 被フォロー関係を通じて参照→自分をフォローしている人
  # has_many :followers, through: :reverse_of_relationships, source: :follower
  # # 与フォロー関係を通じて参照→自分がフォローしている人
  # has_many :followings, through: :relationships, source: :followed

  # def follow(farmer_id)
  #   relationships.create(followed_id: farmer_id)
  # end

  # def unfollow(farmer_id)
  #   relationships.find_by(followed_id: farmer_id).destroy
  # end

  # def following?(farmer)
  #   followings.include?(farmer)
  # end

  attachment :image

  def farmer_title
    farmer_avg_score = self.reviews.average(:score)
    if farmer_avg_score.nil?
      farmer_avg_score = 0
    else
      farmer_avg_score = farmer_avg_score.round(2)
    end

    if farmer_avg_score >= 0.7
      return "ゴールドファーマー"
    elsif farmer_avg_score >= 0.5
      return "シルバーファーマー"
    else
      return "ノーマル"
    end
  end
end
