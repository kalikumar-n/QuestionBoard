class UsersController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only: [:create]
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: UserSerializer.new(@users, include: [:questions]).serialized_json, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :accepted
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
