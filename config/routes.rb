Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :user_decks do
          post '/save_deck', to: 'user_decks#save_deck'
          patch '/complete_deck', to: 'user_decks#complete_deck'
        end
        resources :profiles
      end
    end
  end
end
