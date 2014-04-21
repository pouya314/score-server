Rails.application.routes.draw do

  # These are for public UI
  get 'index/status'
  get 'index/chart'
  get 'index/screen'
  get 'index/ranking'
  # ########################

  devise_for :teams

  resources :challenges, only: [:index, :show] do
    member do
      post 'verify_answer'
    end
  end

  # ROOT of the App
  root 'challenges#index'

end
