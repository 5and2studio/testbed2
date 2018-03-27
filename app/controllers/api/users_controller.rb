class Api::UsersController < ApplicationController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token

  def index
    render json: { list: @users }
  end

  def show
    render json: { user: @user }
  end

  def new
    @user.last_name = "yesitsworking"
    render json: { user: @user }
  end

  def create
    @user.password = "972hfook!7#$2"
    @user.save
    Rails.logger.info @user.errors.full_messages.to_sentence
    render json: { user: @user }
  end

  def user_params
    params.require(:user).permit!
  end
end