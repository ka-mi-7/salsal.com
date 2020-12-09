class Request < ApplicationRecord
  belongs_to :team
  belongs_to :recruit
  enum status: { unconfirmed: 0, approval: 1, disapproval: 2 }
  
  DISPLAY_STATUS = {
    unconfirmed: '未確認',
    approval: '承認',
    disapproval: '未承認'
  }
    
  def display_status
    DISPLAY_STATUS[status.to_sym]
  end
  
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship',  foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :recruit

  
  def follow(other_user)
    unless self == other_user
      self.relationships_find_or_create_by(follow_id: other_user.id)
    end  
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship = destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
end
