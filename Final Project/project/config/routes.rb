Project::Application.routes.draw do
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
=begin
    get 'done/:id' => "assignments#done", :as => 'done'
    get 'late/:id' => "assignments#late", :as=> 'late'
    get 'past/:id,', to: 'assignments#past', as:'past'
=end

end
