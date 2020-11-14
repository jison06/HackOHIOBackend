class Category < ApplicationRecord
  has_many :decks, dependent: :destroy
  belongs_to :user_deck
end
