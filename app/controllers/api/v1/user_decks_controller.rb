module Api
  module V1
    class UserDecksController < ApplicationController
      attr_reader :user_deck

      def index
        @decks = UserDeck.joins(:user_sets).where(user_sets: { completed_at: nil }).uniq
      end

      def create
        @deck = UserDeck.create!(deck_params)
        @user_deck = Api::V1::DeckCreator.new(user, @deck).generate_deck
        render :show
      end

      def show
        @deck = UserDeck.find_by!(id: params[:id])
        @user_deck = UserCard.find_by!(user_set_id: UserSet.is_active(@deck.id).first.id)
      end

      def save_deck
        deck = UserDeck.find_by!(id: params[:user_deck_id])
        Api::V1::DeckCreator.new(user, deck, current_set: UserSet.is_active(deck.id).first).save_and_complete
        render 'api/v1/shared/base_success'
      end

      def complete_deck
        deck = UserDeck.find_by!(id: params[:user_deck_id])
        Api::V1::DeckCreator.new(user, deck, current_set: UserSet.is_active(deck.id).first).complete
        render 'api/v1/shared/base_success'
      end

      private

      def deck_params
        parameters = params.require(:user_deck).permit(:name, :difficulty)
        parameters.merge(user_id: params[:user_id])
      end

      def user
        @user = User.find_by!(id: params[:user_id])
      end
    end
  end
end
