class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  include SessionsHelper
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  def index
    @title = "All users"
    @users = User.page(params[:page])
  end
  def new
    @user = User.new
    @title = "Sign up"
  end
   def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @title = @user.name
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the best blog app in the world!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
      
  def edit
    @title = "Edit user"
  end
  
  private
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  def authenticate
      deny_access unless signed_in?
  end
  def admin_user
      redirect_to(root_path) unless current_user.admin?
  end
end



