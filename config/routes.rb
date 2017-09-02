Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :comments, except: [:show, :new, :index, :edit], controller: "event_comments"
    
    resources :registrations do
      member do
        get 'steps/1' => 'registrations#step1', :as => :step1
        patch 'steps/1/update' => 'registrations#step1_update', :as => :update_step1
        get 'steps/2' => 'registrations#step2', :as => :step2
        patch 'steps/2/update' => 'registrations#step2_update', :as => :update_step2 # NOTE patch vs post
        get 'steps/3' => 'registrations#step3', :as => :step3
        patch 'steps/3/update' => 'registrations#step3_update', :as => :update_step3 # NOTE patch
      end
    end
  end

  namespace :admin do
    root "events#index"
    resources :events do
      resources :registrations, :controller => "event_registrations"
      resources :tickets, :controller => "event_tickets"
      resources :attachments, :controller => "event_attachments"

      collection do
        post :bulk_update
      end

      member do
        post :reorder
      end
    end

    resources :users do
      resource :profile, :controller => "user_profiles"
    end
  end

  resource :user

  get "/faq" => "pages#faq"

  root "events#index"

end
