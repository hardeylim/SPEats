require 'omniauth-google-oauth2'
require 'dotenv'


OmniAuth.config.full_host = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
    Dotenv.load 
end

 