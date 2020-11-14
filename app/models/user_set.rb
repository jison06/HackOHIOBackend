class UserSet < ApplicationRecord
  belongs_to :user_deck
  has_many :user_cards
end
