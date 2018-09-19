require 'httparty'
require 'json'
require 'rest-client'

class WelcomeController < ApplicationController

  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  REDIRECT_URL = ENV['REDIRECT_URL']

  include HTTParty
  include JSON

  def callback
    @authorization_code = params["code"]

    request = {"grant_type" => "authorization_code",
          "client_id" => CLIENT_ID,
          "client_secret" => CLIENT_SECRET,
          "code" => @authorization_code,
          "redirect_uri" => REDIRECT_URL}

        response = RestClient.post('https://app.procore.com/oauth/token', request.to_json, {content_type: :json, accept: :json})
        obj = JSON.parse(response)
        puts response

        access_token = obj['access_token']
        puts access_token

  end

  def resources
    @company_id = params["company_id"]
    @projects = []

    response = RestClient.get("https://app.procore.com/vapid/projects?company_id=#{@company_id}", {"Authorization: Bearer" => access_token})
    projects_response = JSON.parse(response.body)

    puts projects_response

  end
end
