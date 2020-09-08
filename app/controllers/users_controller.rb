class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  def new 
    @user = User.new

  end
  def create 
    #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
        render :new
    end
  end

  def edit
    
  end

  def update

    if @user.update(user_params)
      flash.notice = "User '#{@user.username}' Updated!"
      redirect_to edit_user_path
    else
      redirect_to edit_user_path
      #flash.notice = "Some errors found try again!!!"
      flash.notice = @user.errors.full_messages
    end
  end

  private 
  def user_params
      params.require(:user).permit(:username, :email, :password)
  end
  def find_user
    @user = User.find(params[:id])
  end
end
