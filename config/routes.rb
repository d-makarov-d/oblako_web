Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'projects#index'
    resources :projects
    get '/mobile', to: 'mobile#index'
    post '/mobile', to: 'mobile#create'
    patch '/mobile', to: 'mobile#update'
    put '/mobile', to: 'mobile#update'
end
