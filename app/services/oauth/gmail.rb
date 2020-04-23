module Oauth
  class Gmail

    #BASE_URL = 'https://wwww.googleapis.com/gmail/v1/users/me'
    BASE_URL = 'https://www.googleapis.com/gmail/v1/users/userId/profile'
    
    attr_reader :errors

    def initialize
      errors = []
      response = []
    end

    def verify_oauth_token(google_access_token)
      response = HTTParty.get(BASE_URL,
                              headers:{
                                  'Authorization' => "Bearer #{google_access_token}"
                              })
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
end    


def validate_email
  @email.split('@').last == 'sourcepad.com' || @email == 'sourcepad.spgo@gmail.com' || @email == 'sourcepad.qa@gmail.com'
end