class Review < ApplicationRecord
  belongs_to :user
  belongs_to :farmer

  attachment :image

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true

  def farmer_title

    farmer_avg_score = self.reviews.average(:score).round(2)
    if farmer_avg_score >= 0.7
      return "ゴールドファーマー"
    elsif farmer_avg_score >= 0.5
      return "シルバーファーマー"
    elsif farmer_avg_score >= 0.3
      return "ブロンズファーマー"
    else
      return "normal"
    end
  end

end
