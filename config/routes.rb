Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :categories do
  end
  resources :articles do
    resources :comments do
      resources :notes
    end
  end
  
 
  root 'welcome#index'
end