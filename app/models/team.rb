class Team < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_secure_password
end
