Rails.application.routes.draw do

  resources :tmp_fact_call_details do
    collection do
      get :run_dim
      get :import
      post :do_import
    end
  end
  devise_for :users
  get 'dim_uploader' => 'home#dim_uploader', :as => 'dim_uploader'
  post 'do_import' => 'home#do_import', :as => 'do_import'
  root :to => 'home#index'
end
