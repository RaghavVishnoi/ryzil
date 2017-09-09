Rails.application.routes.draw do

    
  root "home#index"

  resources :products, only: [:index,:show]
  resources :about, only: [:index]
  resources :contact, only: [:index,:create]
  resources :session, only: [:create]

  

    # Routes for admin
  devise_for :admin, controllers: {  
      # confirmations: 'users/confirmations',
      sessions: 'admin/sessions',
      # unlocks: 'users/unlocks',
    }, skip: [:sessions]

    ## custom routes for users
    as :admin do  
       unauthenticated :admin do
        root to: 'admin/sessions#new'
       end

       authenticated :admin do
        root to: 'admin/sessions#new'
       end  
      get 'admin/sign_in' => 'admin/sessions#new', as: :new_admin_session_path_url
      post 'admin/sign_in' => 'admin/sessions#create', as: :session_path
      delete 'admin/sign_out', :to => 'admin/sessions#destroy', as: 'logout'
    end

  
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
 
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
