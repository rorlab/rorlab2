Rails.application.routes.draw do
  root 'welcome#index'

  resources :rcables do
    resources :messages, only: :create
  end
  resources :rblogs
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
