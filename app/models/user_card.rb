class UserCard < ApplicationRecord
  belongs_to :user_set
  belongs_to :cards
end
