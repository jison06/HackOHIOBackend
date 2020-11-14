class UserCard < ApplicationRecord
  belongs_to :user_deck
  has_many :user_sets
end
