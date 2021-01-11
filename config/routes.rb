Rails.application.routes.draw do
  devise_for :admins
  devise_for :farmers
  devise_for :users
  root to: 'job_offers#top'
  scope module: :user do
    resources :users do
    		collection do
    	     get 'quit'
    	     patch 'out'
    	  end
    end
  end
end
