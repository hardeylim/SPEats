class Sessions::Builder

    def initialize(user)
        @user = user
      end
  
      def create_session
        {
          session: {
            user_id: @user.id,
            email: @user.email
          }
        }
      end

  def oauth
    args = {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      response_type: 'code',
      scope: 'https://www.googleapis.com/auth/userinfo.email',
      redirect_uri: 'http://my-app.com/oauth/callback?provider=google',
      access_type: 'offline'
    }
    redirect_to 'https://accounts.google.com/o/oauth2/v2/auth?' + args.to_query
  end

  def callback
    # Exchange the authorization code for an access token (step 5)
    query = {
      code: params[:code],
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      redirect_uri: 'http://my-app.com/oauth/callback?provider=google',
      grant_type: 'authorization_code'
    }
    response = HTTParty.post('https://www.googleapis.com/oauth2/v4/token', query: query)
  
    # Save the access token (step 6)
    session[:access_token] = response['access_token']
  end


end