
class Api::V1::SessionsController < ApplicationController
  def create 
    @service = Oauth::Gmail.new
    email = @service.verify_oauth_token(params[:oauth_token])
    binding.pry
    if @service.errors.blank?
      render json: Sessions::Builder.new.create_session(email)
    else
      raise ServiceError
    end
  end
end