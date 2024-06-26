class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :set_user_by_user_id, only: [:show_by_user_id]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # GET /users/totootjg
  def show_by_user_id
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(reserf_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(user_id: params[:id])
    # render json: { error: "User not found" }, status: :not_found if @user.nil?
  end

  def set_user_by_user_id
    @user = User.find_by(user_id: params[:user_id])
    # render json: { error: "User not found" }, status: :not_found if @user.nil?
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :image, :owner, :user_id, :ip)
  end

  def reserf_params
    params.permit(:ip, :owner, :name)
  end
end
