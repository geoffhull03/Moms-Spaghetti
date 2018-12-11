Rails.application.routes.draw do
  get 'projects/resources'

  get 'projects/forecast'

  get 'welcome/index'

  get 'welcome/callback'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
