Rails.application.routes.draw do

  # These are for public UI
  get 'index/status'
  get 'index/chart'
  get 'index/screen'
  # get 'index/ranking'
  # ########################

  devise_for :teams
  devise_for :admins, skip: [:registrations], controllers: { sessions: "admins/sessions" }

  resources :challenges, except: [:new, :create, :edit, :update, :destroy] do
    member do
      post 'verify_answer'
    end
  end

  
  # namespaced routes for admin access only.
  namespace :private do
    resources :challenges
    get 'attempts/index'
  end


  # ROOT of the App
  root 'challenges#index'

end
