class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash[:errors] = ["Invalid Username or Passowrd"]
      render :new
    end
  end

  def destroy
    if current_user
      logout!
      redirect_to subs_url
    end
  end

end
