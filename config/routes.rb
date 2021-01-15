Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :farmers, controllers: {
    sessions:      'farmers/sessions',
    passwords:     'farmers/passwords',
    registrations: 'farmers/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  scope module: :user do
    root to: 'job_offers#top'
    get 'users/job_offers' => 'job_offers#index'
    get 'users/job_offers/:id' => 'job_offers#show',as: 'users_job_offer'
  end

  scope module: :user do
    resources :users do
    		collection do
    	     get 'quit'
    	     patch 'out'
    	  end
    end
    get 'users/farmers' => 'farmers#index'
    get 'users/farmers/:id' => 'farmers#show',as: 'users_farmer'
  end
  scope module: :farmer do
    scope :farmers do
     resources :job_offers
    end
    resources :farmers do
      collection do
    	     get 'quit'
    	     patch 'out'
    	  end
    end
  end
end
