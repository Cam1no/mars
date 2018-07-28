module User
  class PhotosController < ApplicationController
    before_action :load_resources

    def index
      render json: PhotoSerializer.new(@photos).hash_for_collection
    end

    private

    def load_resources
      case params[:action].to_sym
      when :index
        @photos = Photo.where(tinder_user_id: params[:user_id])
      end
    end
  end
end
