module Api
  module V1
    class DeckCreator
      attr_accessor :user_deck
      attr_reader :user, :difficulty, :cards, :current_set

      def initialize(user, user_deck, **options)
        @user = user
        @user_deck = user_deck
        options.each do |key, value|
          instance_variable_set("@#{key}".to_sym, value)
        end
      end

      def generate_deck
        @deck = user_deck
        set = UserSet.create(user_deck_id: user_deck.id)
        @cards = Card.generate(user_deck.difficulty)
        cards.each do |card|
          UserCard.create(user_set_id: set.id, card_id: card.id)
        end
      end

      def save
        set = UserSet.create(user_deck_id: user_deck.id)
        current_set.user_cards.each do |user_card|
          UserCard.create(user_set_id: set.id, card_id: user_card.card_id)
        end
      end

      def complete
        return if current_set.completed_at

        current_set.update!(completed_at: Time.now)
        user_score = user.score
        current_set.user_cards.each do |user_card|
          card = Card.find_by!(id: user_card.id)
          user_score += Category.find_by!(id: card.category_id).score
        end
        user.update!(score: user_score)
      end
    end
  end
end
