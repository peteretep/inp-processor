Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ini_upload do
    collection do
      post :upload
    end
  end
  root 'ini_upload#index'
end
