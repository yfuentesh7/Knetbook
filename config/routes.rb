Rails.application.routes.draw do
  post 'friendships/:id/add' => 'friendships#add', as: :friendships_add
  post 'friendships/:id/cancel' => 'friendships#cancel', as: :friendships_cancel
  post 'friendships/:id/accept' => 'friendships#accept', as: :friendships_accept
  resources :friendships

  post 'posts/:id/toggle_like' => 'posts#toggle_like', as: :post_toggle_like
  resources :posts
  resources :comments
  get 'user/profile' => 'users#profile', as: :user_profile
  #get 'users/index'
  #post 'users/update'
  #get 'users/show/:id' => 'users#show', as: :users_show

  devise_for :users
  resources :users
  get 'home/index'
  root 'home#index'

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
