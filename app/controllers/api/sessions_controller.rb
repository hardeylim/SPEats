
class Api::SessionsController < ApplicationController
  def create 
    @service = Oauth::Gmail.new
    email = @service.verify_oauth_token(params[:oauth_token])
    if @service.errors.blank?
      render json: Sessions::Builder.new.create_session(email)
    else
      raise ServiceError
    end
  end
end