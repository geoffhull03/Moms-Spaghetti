require 'httparty'
require 'json'
require 'rest-client'

class ProjectsController < WelcomeController
  alias_method :callback, :resources

  include HTTParty
  include JSON

  def resources
    super

    @company_id = params["company_id"]
    @projects = []

    if @access_token
      puts @access_token
    else
      puts "no access token"
    end

    response = RestClient.get("https://app.procore.com/vapid/projects?company_id=#{@company_id}", {"Authorization: Bearer" => @access_token})
    projects_response = JSON.parse(response.body)

    puts projects_response
  end
end
