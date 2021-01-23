class JobOffer < ApplicationRecord
  # attachment :image
  belongs_to :farmer
  belongs_to :genre
  has_many :favos, dependent: :destroy

  def favorited_by?(user)
    favos.where(user_id: user.id).exists?
  end

  enum is_valid: { "募集中": true, "締め切り": false }
end
