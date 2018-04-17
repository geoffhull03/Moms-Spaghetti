require 'httparty'
require 'json'
require 'rest-client'

class WelcomeController < ApplicationController

  CLIENT_ID = ENV['client_id']
  CLIENT_SECRET = ENV['client_secret']
  REDIRECT_URL = ENV['redirect_uri']

  include HTTParty
  include JSON

  def callback
    @authorization_code = params["code"]

    RestClient.post('https://app.procore.com/oauth/token', {
      "grant_type" => "authorization_code",
      "client_id" => CLIENT_ID,
      "client_secret" => CLIENT_SECRET,
      "code" => @authorization_code,
      "redirect_uri" => REDIRECT_URL
    }.to_json, content_type: :json, accept: :json)
      puts response.body
    #@me_request['authorization'] = "Bearer #{json['access_token']}"
  end

  #def get_me
  #  RestClient.get('https://app.procore.com/vapid/me', )

  #end
end
