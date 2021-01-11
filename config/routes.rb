Rails.application.routes.draw do
  devise_for :admins
  devise_for :farmers
  devise_for :users
  root to: 'job_offers#top'
end
