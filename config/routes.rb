Rails.application.routes.draw do

  devise_for :users
  get 'sets/index'
  post 'sets/upload_file' => 'sets#upload_file'
  post 'sets/download_file' => 'sets#download_file'
  root "items#index"
  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
