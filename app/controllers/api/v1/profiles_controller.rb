module Api
  module V1
    class ProfilesController < ApplicationController
      def show
        @profile = user.profile
      end

      def create
        @profile = Profile.create!(profile_params)
        render :show
      end

      def update
        @profile = user.profile.update!(profile_params)
        render :show
      end

      private

      def profile_params
        parameters = params.require(:profile).permit(:bio)
        parameters.merge(user_id: params[:user_id])
      end

      def user
        @user = User.find_by!(id: params[:user_id])
      end
    end
  end
end
