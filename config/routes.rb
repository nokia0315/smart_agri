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
    scope :users do
      resources :job_offers, only: [:index, :show],as: 'users_job_offers' do
       resource :favos, only: [:create, :destroy]
      end
    end

  end

  scope module: :user do
   get 'users/farmers' => 'farmers#index',as: 'users_farmers_index'
    resources :users do
    		collection do
    	     get 'quit'
    	     patch 'out'
    	  end
    end
    get 'users/farmers/:id' => 'farmers#show',as: 'users_farmer'
  end

  scope module: :farmer do
    scope :farmers do
     resources :job_offers
     resources :genres, only: [:index, :create, :edit, :update, :show]
     resources :blogs, only: [:new, :create, :index, :show, :destroy]
    end
    resources :farmers do
      collection do
    	     get 'quit'
    	     patch 'out'
    	  end
    end
  end
end
