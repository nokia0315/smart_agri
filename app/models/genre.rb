class Genre < ApplicationRecord
  has_many :job_offers

	validates :name, presence: true
end
