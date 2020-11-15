class UserSet < ApplicationRecord
  belongs_to :user_deck
  has_many :user_cards

  scope :all_saved_for, lambda { |user_id|
    joins(:user_deck).where(is_saved: true).where(completed_at: nil).where(user_decks: { user_id: user_id })
  }

  scope :is_active, lambda{ |deck_id|
    where(user_deck_id: deck_id).where(is_active: true)
  }

  scope :saved_set_for, lambda { |deck_id|
    where(user_deck_id: deck_id).where(is_saved: true).where(is_active: false)
  }
end
