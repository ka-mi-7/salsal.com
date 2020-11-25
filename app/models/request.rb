class Request < ApplicationRecord
  belongs_to :team
  belongs_to :recruit
  enum status: { unconfirmed: 0, approval: 1, disapproval: 2 }
end
