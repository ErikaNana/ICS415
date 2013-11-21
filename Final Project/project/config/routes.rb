Project::Application.routes.draw do
    root :to => "static#home" #controller#action
    get  'auth/facebook/callback' => 'sessions#create',:as => 'login'
    post 'logout' => 'sessions#destroy'
    get  'auth/failure' => 'sessions#failure'
end
