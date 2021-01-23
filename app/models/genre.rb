class Genre < ApplicationRecord
  has_many :job_offers
  belongs_to :farmer

  validates :name, presence: true
end
