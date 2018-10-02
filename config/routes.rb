Rails.application.routes.draw do


  get 'users/show'
  resources :genres
  resources :books do
    get :claim, on: :member
    get :unclaim, on: :member
    resources :reviews
  end

  get 'user' => 'users#show'
  get 'edit_user' => 'users#edit'

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
        }

  root to: 'home_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
