class UserDeck < ApplicationRecord
  belongs_to :user
  has_many :user_cards, through: :user_sets
  has_many :user_sets

  validates :name, length: { maximum: 50 }, presence: true
end
