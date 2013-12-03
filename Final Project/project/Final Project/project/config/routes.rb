Project::Application.routes.draw do
  get "o_users/new"
    resources :courses do
        resources :assignments
    end
    root :to => "static#welcome" #controller#action
    get 'auth/facebook/callback' => 'sessions#create'
    get 'auth/logout' => 'sessions#destroy',  :as => 'logout'
    get 'auth/failure' => 'sessions#failure'
    get 'home' => 'static#home'
    post 'home' => 'static#home'
    get 'about' => 'static#about'
    post 'validate' => "o_users#validate", :as => "validate"
    get 'signup' => "o_users#signup"
=begin
    get 'done/:id' => "assignments#done", :as => 'done'
    get 'late/:id' => "assignments#late", :as=> 'late'
    get 'past/:id,', to: 'assignments#past', as:'past'
=end
    resources :o_users
end
