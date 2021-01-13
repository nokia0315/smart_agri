class JobOffer < ApplicationRecord
    #attachment :image
    belongs_to :farmer

  enum is_valid: {"募集中": true, "締め切り": false }
end
