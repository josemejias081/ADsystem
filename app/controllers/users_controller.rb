class UsersController < ApplicationController
  #class RegistrationsController < Devise::RegistrationsController
  load_and_authorize_resource
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User was successfully created." 
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, status: :see_other
  end

  private
   def set_user
    @user = User.find(params[:id])
   end

   def user_params
    params.require(:user).permit(:id, :name, :email, :role, :password, :password_confirmation)
   end
end
