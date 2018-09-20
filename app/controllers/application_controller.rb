class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_has_token
  #@access_token = access_token.access_token
  end
end
