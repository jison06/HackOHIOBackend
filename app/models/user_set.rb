class UserSet < ApplicationRecord
  belongs_to :user_deck
  has_many :user_cards

  scope :is_active, lambda{ |deck_id|
    where(user_deck_id: deck_id).where(is_active: true)
  }
end
