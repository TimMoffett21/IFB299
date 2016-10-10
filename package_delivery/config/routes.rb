Rails.application.routes.draw do


  get 'onthespotnews', to:'news#CustomerNews' 
  
  get 'customeregistration', to:'news#cus_reg'


  get 'sessions/new'

  get '/managerfaq',  to:'fa_q#manager_faq'
  get '/customerfaq',to:'fa_q#customer_faq'
  
  #get 'home/index'
  get '/home', to: "home#home"
  get '/termsandcondition', to: "home#index"
  get  '/signup',  to: 'users#new'
  get  '/employeelogin',  to: 'users#show_employee'
  get  '/customerlogin', to: 'users#show_customer'
  get  '/edit_user' , to: 'users#edit'
  get  '/all_user', to: 'users#index'
  get  '/edit' , to: 'users#edit'
  
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  
  
  
 
  
  
  
  resources :fa_q_main_lists
  resources :fa_q_sub_lists
  resources :contacts
  resources :pickups
  resources :testimonies
  resources :quotes do
    collection do
      get :new
      get :show
    end
  end
  get   '/assignjob', to:'users#assignjob'
  post '/assignjob', to:'users#assignjob'
  
  get   '/updatepickupstatusnext', to:'users#updatepickupstatusnext'
  post '/updatepickupstatusnext', to:'users#updatepickupstatusnext'
  
  get   '/updatepickupstatusback', to:'users#updatepickupstatusback'
  post '/updatepickupstatusback', to:'users#updatepickupstatusback'
  
   get   '/updatedeliverystatusnext', to:'users#updatedeliverystatusnext'
  post '/updatedeliverystatusnext', to:'users#updatedeliverystatusnext'
  
  get   '/updatedeliverystatusback', to:'users#updatedeliverystatusback'
  post '/updatedeliverystatusback', to:'users#updatedeliverystatusback'
  
  resources :users
  
  resources :news
  
  
  
  root :to => 'home#home'


  
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
