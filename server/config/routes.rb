Rails.application.routes.draw do
  resources :clients do
    collection do
      get :import
      post :do_import
    end
  end
  resources :projects do
    collection do
      get :import
      post :do_import
    end
  end
  devise_for :users
  root :to => 'home#index'
end
