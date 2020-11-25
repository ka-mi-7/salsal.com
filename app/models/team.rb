class Team < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_secure_password
  has_many :requests
  has_many :recruits
end
