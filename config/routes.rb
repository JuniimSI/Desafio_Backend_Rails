Rails.application.routes.draw do

  ##Routes errors
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match "/400", to: "errors#bad_request", via: :all
  
  ##home
  root to: "home#index"

  #Routes from candidatos
  post '/candidato/importar', to: 'candidato#importar'
  resources :candidato 

end
