Wizard::Application.routes.draw do

  get "pages/welcome", :as => :welcome

  resources :projects, :only => [:create]

  root :to => 'pages#welcome'

end