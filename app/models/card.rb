class Card < ApplicationRecord
  has_many :categories
  has_many :user_cards

  scope :get_easy_cards, lambda{
    joins(:category).where(categories: { difficulty: 'easy' }).order(Arel.sql('RANDOM()'))
  }

  scope :get_medium_cards, lambda{
    joins(:category).where(categories: { difficulty: 'medium' }).order(Arel.sql('RANDOM()'))
  }

  scope :get_hard_cards, lambda{
    joins(:category).where(categories: { difficulty: 'hard' }).order(Arel.sql('RANDOM()'))
  }

  scope :for_difficulty, lambda { |difficulty|
    joins(:category).where(categories: { difficulty: difficulty }).order(Arel.sql('RANDOM()'))
  }

  def self.generate(difficulty)
    case difficulty
    when 'easy'
      get_easy_cards.limit(12)
    when 'medium'
      get_easy_cards.limit(6) + get_medium_cards.limit(6)
    when 'hard'
      get_easy_cards.limit(2) + get_medium_cards.limit(4) + get_hard_cards.limit(6)
    end
  end
end
