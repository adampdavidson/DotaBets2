Crowdfunder::Application.routes.draw do

  



  resources :users, :except => [:index]
  resources :projects do
  resources :bets, :only => [:new, :create]
  end
  resources :user_sessions

  namespace :my do 
  resources :bets # => My::BetsController
  end


  	match 'login' => 'user_sessions#new', :as => :login
	match 'logout' => 'user_sessions#destroy', :as => :logout

  root :to => "welcome#index"

end
