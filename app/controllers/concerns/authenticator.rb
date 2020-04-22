# frozen_string_literal: true

module Authenticator
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= User.find_by_valid_token request_details
  end

  def request_details
    @request_details ||=
      {
        access_token: request.headers['Authorization'] || params[:authentication]
      }
  end

  def authenticate_request
    raise ApiExceptions::ExpiredSessionError unless current_user.present?
  end
end
