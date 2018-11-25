Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :inp_upload do
    collection do
      post :upload
    end
  end
  resources :buildings
  root 'inp_upload#index'
end
