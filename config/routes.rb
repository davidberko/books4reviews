Rails.application.routes.draw do



  devise_for :admins do
    resources :reviews
  end

  resources :reviews do
    member do
      put 'helpful' => 'reviews#helpful'
      put 'unhelpful' => 'reviews#unhelpful'
    end
  end

  resources :charges
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

  get 'new_author' => 'users#new_author'
  get 'new_reviewer' => 'users#new_reviewer'

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
        }

  root to: 'home_pages#index'

  get 'admin' => 'reviews#index'


  get 'author_signup' => 'home_pages#author_signup'
  get 'reviewer_signup' => 'home_pages#reviewer_signup'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
