Rails.application.routes.draw do
  resources :twitter_accounts
  
resources :tweets do
  member do
    get 'tweet'
    get 'check'
  end
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
