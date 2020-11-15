module Api
  module V1
    class UserDecksController < ApplicationController
      attr_reader :user_deck

      def index
        @saved_sets = UserSet.all_saved_for(params[:user_id])
      end

      def create
        @deck = UserDeck.create!(deck_params)
        @user_deck = Api::V1::DeckCreator.new(user, @deck).generate_deck
        render :show
      end

      def show
        @saved_sets = UserSet.all_saved_for(params[:user_id])
        @difficulty = UserSet.all_saved_for(params[:user_id]).first.user_cards.max_by {  |user_card| user_card.card.category_id  }.card.category_id
        render :saved_sets
      end

      def save_deck
        deck = UserDeck.find_by!(id: params[:user_deck_id])
        Api::V1::DeckCreator.new(user, deck, current_set: UserSet.is_active(deck.id).first, name: params[:name]).save_and_complete
        render 'api/v1/shared/base_success'
      end

      def complete_deck
        deck = UserDeck.find_by!(id: params[:user_deck_id])
        Api::V1::DeckCreator.new(user, deck, current_set: UserSet.is_active(deck.id).first).complete
        render 'api/v1/shared/base_success'
      end

      def start
        deck = UserDeck.find_by!(id: params[:user_deck_id])
        Api::V1::DeckCreator.new(user, deck, current_set: UserSet.saved_set_for(deck.id).first, name: deck.name).save_and_complete
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
