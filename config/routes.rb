Rails.application.routes.draw do
  root 'polls#new'

  resources :polls
  resources :feedbacks
  resources :users do
    collection do
      get 'search_user'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
