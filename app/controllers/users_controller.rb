class UsersController < ApplicationController
  before_action :load_resources

  def index
    render json: UserSerializer.new(@users).hash_for_collection
  end

  private

  def load_resources
    case params[:action].to_sym
    when :index
      @users = TinderUser.limit(2)
    end
  end
end
