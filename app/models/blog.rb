class Blog < ApplicationRecord
  belongs_to :farmer
  attachment :image
end
