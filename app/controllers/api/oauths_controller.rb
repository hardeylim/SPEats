class Api::OauthsController < ApplicationController

  BASE_URL = 'https://www.googleapis.com/auth/userinfo.email'

  def initialize
    errors = []
    response = []
  end

def oauth
  args = {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      response_type: 'code',
      scope: 'https://www.googleapis.com/auth/userinfo.email',
      redirect_uri: 'http://localhost:3000/api/oauth/callback?provider=google',
      access_type: 'offline'
  }
  redirect_to 'https://accounts.google.com/o/oauth2/v2/auth?' + args.to_query
end

def callback
  query = {
    code: params[:code],
    client_id: ENV['GOOGLE_CLIENT_ID'],
    client_secret: ENV['GOOGLE_CLIENT_SECRET'],
    redirect_uri: 'http://localhost:3000/api/oauth/callback?provider=google',
    grant_type: 'authorization_code'
  }
  response = HTTParty.post('https://www.googleapis.com/oauth2/v4/token', query: query)

  session[:access_token] = response[':access_token']

  headers = {
  'Content-Type': 'application/json',
  'Authorization': "Bearer #{session[:access_token]}"
}
  response = HTTParty.get('https://www.googleapis.com/auth/userinfo.email',
  headers: headers
  )
 
  response = JSON.parse(response.body)
      if response['error'].present?
        @errors = response['error']
        nil
      else
        # find the email
        response['email']
      end

  
    end
end