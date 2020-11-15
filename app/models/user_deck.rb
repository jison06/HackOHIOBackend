class UserDeck < ApplicationRecord
  belongs_to :user
  has_many :user_cards, through: :user_sets
  has_many :user_sets

  validates :name, length: { maximum: 50 }
  validates :difficulty, presence: true

  scope :get_saved_decks, lambda { |user_id|
    where(user_id: user_id).joins(:user_sets).where(is_saved: true)
  }
end
