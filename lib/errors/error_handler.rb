# frozen_string_literal: true

module Errors
  module ErrorHandler
    # self.included is called whenever a module gets included in a class
    # klass.class_eval adds whatever is inside the block into the class
    # This method adds rescue clauses to the class
    def self.included(klass)
      klass.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(error_messages: e)
        end
        rescue_from ActiveRecord::RecordInvalid do |e|
          respond(error_messages: e, status: :bad_request)
        end
        rescue_from ActionController::ParameterMissing do |e|
          respond(error_messages: e, status: :bad_request)
        end
      end
    end

    def respond(template: 'api/v1/shared/base_error', error_messages: '', status: :not_found)
      error = format_error(error_messages)

      instance_variable_set(:@errors, error)
      render template, status: status
    end

    private

    def format_error(error_messages)
      if error_messages.respond_to?(:record)
        error_messages.record.errors.full_messages
      else
        error_messages.to_s
      end
    end
  end
end
