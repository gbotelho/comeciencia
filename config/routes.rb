Rails.application.routes.draw do
  resources :users
  resources :people
  resources :diets
  resources :foods
  get 'food/select_unselect/:id_food/:id_person' => 'foods#select_unselect', :as => :select_unselect_food
  get 'food/select/:id_food/:id_person' => 'foods#select', :as => :select_food
  get 'food/unselect/:id_food/:id_person' => 'foods#unselect', :as => :unselect_food
  get 'food/list/:id_person' => 'foods#list', :as => :list_food
  get 'food/list_one/:id_person' => 'foods#list_one', :as => :list_one_food
  get 'food/list_carbs/:id_person' => 'foods#list_carbs', :as => :list_carbs_food
  get 'food/list_proteins/:id_person' => 'foods#list_proteins', :as => :list_proteins_food
  get 'food/list_fats/:id_person' => 'foods#list_fats', :as => :list_fats_food
  get 'diet/personalize/:id_person' => 'diets#personalize', :as => :personalize_diet
  get 'diet/discover/:id_person' => 'diets#discover', :as => :discover_diet
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'people#new'

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
  resources :articles do
    resources :comments
  end
end
