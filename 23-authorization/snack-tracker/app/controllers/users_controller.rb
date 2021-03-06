class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user][:username], password: params[:user][:password])

    if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to snacks_path
    else 
        render :new
    end
  end   

end
