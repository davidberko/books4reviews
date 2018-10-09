Rails.application.routes.draw do



  resources :genres
  resources :notifications do
    collection do
      post :mark_as_read
   end
 end
  resources :books do
    get :claim, on: :member
    get :unclaim, on: :member
    resources :reviews
  end

  get 'user/:id' => 'users#show', as: 'user'
  get 'reviewers' => 'users#reviewer', as: 'reviewers'
  get 'authors' => 'users#author', as: 'authors'
  get 'current_user' => 'users#profile'
  get 'edit_user' => 'users#edit'

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
        }

  root to: 'home_pages#index'

  get 'author_signup' => 'home_pages#author_signup'
  get 'reviewer_signup' => 'home_pages#reviewer_signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
