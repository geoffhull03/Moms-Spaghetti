require 'httparty'
require 'json'
require 'rest-client'

class ProjectsController < WelcomeController
  include HTTParty
  include JSON

  def resources
    @company_id = params["company_id"]

    response = RestClient.get("https://api-sandbox-monthly.procore.com/vapid/projects?company_id=#{@company_id}", {"Authorization": "Bearer #{session[:access_token]}"})
    @projects = JSON.parse(response)

      @projects.each do |project|
        arr = []
        arr.push(project['id'])
        puts arr

        monitoring_resources = RestClient.get("https://api-sandbox-monthly.procore.com/vapid/projects/#{arr[0]}/monitoring_resources", {"Authorization": "Bearer #{session[:access_token]}"})
        @monitoring_resources = JSON.parse(monitoring_resources)
          if @monitoring_resources == []
            puts "#{project['name']} (#{project['id']}) has no monitoring resources, loser"
          else puts @monitoring_resources
          end




      end
  end
end
