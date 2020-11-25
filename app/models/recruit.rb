class Recruit < ApplicationRecord
  belongs_to :team
  has_many :requests
end
