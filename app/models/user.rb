class User < ApplicationRecord
  has_secure_password
  has_one :profile, dependent: :destroy
  has_many :user_decks, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :username, presence: true, length: { maximum: 30 }
end
