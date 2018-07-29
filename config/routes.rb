# frozen_string_literal: true

# == Route Map
#
#                    Prefix Verb URI Pattern                                                                              Controller#Action
#                      root GET  /                                                                                        react#root
#               user_photos GET  /users/:user_id/photos(.:format)                                                         user/photos#index
#                     users GET  /users(.:format)                                                                         users#index
#                    photos GET  /photos(.:format)                                                                        photos#index
#        rails_service_blob GET  /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET  /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET  /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT  /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root to: 'react#root'
  resources :users, only: %i(index show) do
    scope module: :user do
      resources :photos, only: %i(index)
    end
  end
  resources :photos, only: %i(index)
end
