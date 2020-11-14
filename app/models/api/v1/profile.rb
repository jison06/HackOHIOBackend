module Api
  module V1
    class Profile < ApplicationRecord
      belongs_to :user
      validates :bio, length: { maximum: 1000 }
    end
  end
end
