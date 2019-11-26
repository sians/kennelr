Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: {registrations: "registrations"}
  root to: 'pages#home'
  get 'profile',  to: 'pages#profile', as: 'profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kennels do
    resources :bookings, except: [:index]
    resources :kennel_photos, except:[:index]
    get 'photos', to: 'kennel_photos#index', as: 'photos'
  end
  get 'bookings', to: 'bookings#index', as: 'bookings'
  resources :dogs
end
