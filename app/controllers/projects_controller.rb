require 'httparty'
require 'json'
require 'rest-client'
require 'date'
require 'bootstrap-datepicker-rails'

class ProjectsController < WelcomeController
  include HTTParty
  include JSON

  def resources
    @company_id = params["company_id"]

    response = RestClient.get("https://api.procore.com/vapid/projects?company_id=#{@company_id}", {"Authorization": "Bearer #{session[:access_token]}"})
    @projects = JSON.parse(response)
    puts @projects

    @monitoring_resources = []
      @projects.each do |project|
        monitoring_resources = RestClient.get("https://api.procore.com/vapid/projects/#{project['id']}/monitoring_resources", {"Authorization": "Bearer #{session[:access_token]}"})
        @monitoring_resources += JSON.parse(monitoring_resources)
      end
  end

  def forecast
    @company_id = params["company_id"]

    response = RestClient.get("https://api.procore.com/vapid/projects?company_id=#{@company_id}", {"Authorization": "Bearer #{session[:access_token]}"})
    @projects = JSON.parse(response)

    @monitoring_resources = []
      @projects.each do |project|
        monitoring_resources = RestClient.get("https://api.procore.com/vapid/projects/#{project['id']}/monitoring_resources", {"Authorization": "Bearer #{session[:access_token]}"})
        @monitoring_resources += JSON.parse(monitoring_resources)
      end


  end
end
