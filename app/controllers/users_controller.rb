class UsersController < ApplicationController
  def log_in
    @user = User.new
  end

  def sign_in
    @user = User.find_by(username: session_params[:username])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Error logging in"
      redirect_to log_in_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to root_path, status: :created
    else
      flash[:alert] = "Error creating user!"
      render :new, status: :unprocessable_entity
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:role, :username, :email, :password, :password_confirmation)
  end

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
