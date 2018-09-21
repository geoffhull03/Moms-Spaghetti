require 'httparty'
require 'json'
require 'rest-client'

class ProjectsController < WelcomeController
  include HTTParty
  include JSON

  def callback
    super
  end

  def resources
    #callback
    @company_id = params["company_id"]

    if @access_token
      puts @access_token
    else
      puts "no access token"
    end

    response = RestClient.get("https://app.procore.com/vapid/projects?company_id=#{@company_id}", {"Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzUxMiJ9.eyJhaWQiOiI1N2QzZDkxMWZmOTdiODY2NTMzZWFlYzhkZDYxNjhhOWQ5OWI2Yjc1YjA5NWRjODE3YTBiMDE5MmQxOTA2YWQxIiwiZXhwIjoxNTM3NTYwNzA5LCJ1aWQiOjM1ODQ5MDB9.ACZROjmWGz3GiNqERD2AOKr_ReJaJU_RxrAmhDvlD3z-p2Je6RQtZHg6Yq-ZMwZbXEuvnpeD8MxSGwyDZkBTUYgTADba1c6xAvD5nppeYVYeegipzsn77452ysNXPOVW6cUaIHEBeQgGb5tX1kTtrW0bZr37zCMO8fUue4Ei1iCsz6mq"})
    @projects = JSON.parse(response)


  end
end
