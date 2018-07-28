class UsersController < ApplicationController
  before_action :load_resources

  def index
    render json: UserSerializer.new(@user).hash_for_collection 
  end

  private

  def load_resources
    case params[:action].to_sym
    when :index
      @user = TinderUser.limit(2)
    end
  end
end
