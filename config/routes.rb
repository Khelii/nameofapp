Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :products do
    resources :comments
  end


  get 'simple_pages/products'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page' #, to: 'products#index'
    root to: 'simple_pages#landing_page'
  post 'simple_pages/thank_you'
  post 'payments/create'

  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
