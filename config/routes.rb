Mokio::Engine.routes.draw do
  root to: "dashboard#show"
  devise_for :users, class_name: "Mokio::User", module: :devise
  
      #
      # menus routes
      #
      resources :menus do 
        member do
          get :update_menu_breadcrumps
          get :copy
        end

        collection do
          post :sort
          get  :lang_changed
        end
      end

      #
      # static_modules routes
      #
      resources :static_modules do
        member do
          get :copy
          get :update_active
        end
      end
      
      resources :users do
        member do
          get :copy
          get :edit_password
          patch :update_password
        end
      end

      #
      # contents routes
      #
      resources :contents do
        member do
          get  :copy
          post :update_active
        end

        collection do
          get '/only_loose', to: 'contents#index', :only_loose => 1
        end
      end

      resources :articles do
        member do
          get  :copy
          post :update_active
        end
      end

      resources :pic_galleries do
        member do
          get  :copy
          post :update_active
        end
      end

      resources :mov_galleries do
        member do
          get  :copy
          post :update_active
        end
      end

      resources :contacts do
        member do
          get  :copy
          post :update_active
        end
      end


      #
      # data_files routes
      #
      resources :data_files do
        collection do
          post :sort        
        end
      end
      
      #
      # photos routes
      #
      resources :photos do
        member do
          get    :get_photo
          get    :get_thumb
          get    :rotate_photo
          get    :rotate_thumb
          post   :crop_photo
          post   :crop_thumb
          post   :upload_external_links
          patch  :update_thumb
          delete :remove_thumb
        end
      end

      #
      # youtubes routes
      #
      resources :youtubes do
        member do
          patch :update_thumb
          get   :preview_movie
          get   :load_new_form
        end

        collection do
          post :find
        end
      end
      
          #
      # external_scripts
      #
      resources :external_scripts do
        member do
          post :update_active
          get  :copy

        end
      end


      resources :module_positions do
        member do
          get :update_active
          get  :copy
        end
      end

      resources :langs do
        member do
          post :update_active
          get :copy
        end
      end
      
end

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
end
