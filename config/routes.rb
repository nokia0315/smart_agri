Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }
  devise_for :farmers, controllers: {
    sessions: 'farmers/sessions',
    passwords: 'farmers/passwords',
    registrations: 'farmers/registrations',
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks",
  }

  get 'search/search'
  get 'contact/index'
  get 'contact/confirm'
  get 'contact/thanks'

  scope module: :farmer do
    get 'f-top' => 'job_offers#top', as: 'top'
    scope :farmers do
      resources :job_offers, as: 'farmers_job_offers'
      resources :genres, only: [:index, :create, :edit, :update]
      resources :blogs, only: [:new, :create, :index, :show, :destroy]
    end
    resources :farmers do
      collection do
        get 'quit'
        patch 'out'
      end
    end
  end

  scope module: :user do
    root to: 'job_offers#top'
    scope :users do
      resources :job_offers, only: [:index, :show], as: 'users_job_offers' do
        resource :favos, only: [:create, :destroy]
      end
      resources :farmers, only: [:index, :show], as: 'users_farmers' do
        resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
        resources :reviews, as: 'reviews'
        get 'blogs/:id' => 'blogs#show', as: 'blog'
      end

    end

    resources :users do
      collection do
        get 'quit'
        patch 'out'
      end
    end
  end
  # お問い合わせ
  get   'contact'         => 'contact#index'     # 入力画面
  post  'contact/confirm' => 'contact#confirm'   # 確認画面
  post  'contact/thanks'  => 'contact#thanks'    # 送信完了画面
end
