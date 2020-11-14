# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :user, only: [:destroy, :update, :show]

      def index
        @users = User.all
      end

      def create
        @user = User.create!(user_params)
        render :show
      end

      def destroy
        user.destroy!
        render 'api/v1/shared/delete'
      end

      def show; end

      def update
        user.update!(user_params)
        render :show
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
      end

      def user
        @user ||= User.find_by!(id: params[:id])
      end
    end
  end
end
