Rails.application.routes.draw do

  use_doorkeeper
 resources :projects

  devise_for :users, :path => '', :path_names => { :sign_in => 'login', :sign_out => 'logout' }, :controllers => { :registrations => 'users/registrations'  }

  root to: 'projects#index'
  use_doorkeeper do
    skip_controllers :authorizations, :applications,
                     :authorized_applications
  end

  scope module: :api, defaults: { format: :json }, path: 'api/v1' do
    scope module: :v1 do
      resources :projects , only: [:show] do
      get :currently_working_projects, on: :collection
      get :all_assigned_projects, on: :collection
      end
      end
    #   post :allocate_phone_number, on: :collection
    #   get :me, on: :collection
    # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  end
