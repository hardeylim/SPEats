# frozen_string_literal: true

module ApiExceptions
  extend ActiveSupport::Concern

  included do
    class InvalidCredentialsError < StandardError; end
    rescue_from InvalidCredentialsError do
      render json: { error: "Your email and password don't match" }, status: :unauthorized
    end

    #
    # raise an error if:
    # the token is an invalid token
    # either it is an old token
    # or simple the token does not exist
    #
    class ExpiredSessionError < StandardError; end
    rescue_from ExpiredSessionError do
      render json: { error: 'Your session has expired' }, status: :unauthorized # unofficial expired session
    end

    #
    # raises if the auth token is missing
    #
    class UnauthorizedAccessError < StandardError; end
    rescue_from UnauthorizedAccessError do
      render json: { error: 'Access Denied' }, status: 403
    end

    #
    # raise if the user is inactive
    #
    class InvalidTokenError < StandardError; end
    rescue_from InvalidTokenError do
      render json: { error: 'Token is invalid' }, status: :unauthorized # unofficial expired session
    end

    #
    # raise if a process is halted
    #
    class ServiceError < StandardError; end
    rescue_from ServiceError do
      render json: { errors: @service.errors }, status: 422
    end

    #
    # Invalid Request
    #
    class InvalidRequestError < StandardError; end
    rescue_from InvalidRequestError do
      render json: { error: 'Request is invalid' }, status: 422
    end

    class InvalidLogin < StandardError; end
    rescue_from InvalidLogin do
      render json: { error: 'Incorrect user/email or password' }, status: :unauthorized
    end
  end
end
