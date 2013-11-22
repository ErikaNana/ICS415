Project::Application.routes.draw do
    root :to => "static#welcome" #controller#action
    get 'auth/facebook/callback' => 'sessions#create'
    get 'auth/logout' => 'sessions#destroy',  :as => 'logout'
    get 'auth/failure' => 'sessions#failure'
    get 'home' => 'static#home'
end
