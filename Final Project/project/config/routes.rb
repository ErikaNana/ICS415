Project::Application.routes.draw do
    root :to => "static#home" #controller#action
    get  'auth/facebook/callback' => 'sessions#create',:as => 'login'
    get 'auth/logout' => 'sessions#destroy',  :as => 'logout'
    get  'auth/failure' => 'sessions#failure'
end
