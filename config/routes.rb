Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :landlords, only: [:index, :show, :create, :update, :destroy]
      resources :properties, only: [:index, :show, :create]
      resources :reviews, only: [:index, :create]
    end
  end

end
