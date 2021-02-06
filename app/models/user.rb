class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(google_oauth2)
  has_many :favos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  attachment :image

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # deviseのuserカラムに name を追加している場合は以下のコメントアウトも追記します
      # user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def farmer_title
    if self.average(:score).round(2) >= 0.7
      return "ゴールドファーマー"
    elsif self.average(:score).round(2) >= 0.5
      return "シルバーファーマー"
    elsif self.average(:score).round(2) >= 0.3
      return "ブロンズファーマー"
    elsif self.average(:score).round(2).blank?
      return ""
    end
  end

  # # 自分がフォローされる（被フォロー）側の関係性
  # has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # # 自分がフォローする（与フォロー）側の関係性
  # has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
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
end
