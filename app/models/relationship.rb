class Relationship < ApplicationRecord
  belongs_to :recruit
  belongs_to :follow, class_name: 'Recuit'
  
  validates :team_id, presence: true
  validates :follow_id, presence: true
end
