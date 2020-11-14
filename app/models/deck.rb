class Deck < ApplicationRecord
  belongs_to :category
  has_many :cards, dependent: :destroy
end
