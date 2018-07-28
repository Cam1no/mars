class PhotosController < ApplicationController
  before_action :load_resources

  def index
    render json: PhotoSerializer.new(@photo).hash_for_collection 
  end

  private

  def load_resources
    case params[:action].to_sym
    when :index
      @photo = Photo.limit(10)
    end
  end
end