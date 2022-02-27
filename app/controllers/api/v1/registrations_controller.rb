module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        result = CreateRegistration.call(create_params)

        if result.success?
          render json: result.data, status: :created
        else
          render json: { error: result.error }, status: :unprocessable_entity
        end
      end

      def index
        all = []
        all.push(User.all)
        all.push(Account.all) 
        render json: all, status: :created
      end

      private

      def create_params
        params.require(:account)
              .permit(:name, :from_partner, :many_partners, users: %i[email first_name last_name phone])
      end
    end
  end
end
