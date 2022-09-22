Rails.application.routes.draw do
   # If we want to put our resources behind an `api/` route, just wrap them around
   scope '/api' do
    scope 'v1' do
      devise_for :admins,
        controllers: {
          sessions: 'admins/sessions',
          registrations: 'admins/registrations',
        }
    end
  end

  namespace :api do
    namespace :v1 do
      resources :managers, only: [:index, :create, :new, :show, :update]
    end
  end

  # devise_for :admins
  # namespace :api do
  #   namespace :v1 do
  #     resources :managers
  #   end
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
