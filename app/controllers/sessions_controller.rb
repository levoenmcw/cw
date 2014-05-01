class SessionsController < ApplicationController

  def new
  end

def create_fb
user=User.from_omniauth(env["omniauth.auth"])
session[:user_id] = user.id
redirect_to root_path
end
  
def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end



  def destroy
session[:user_id]=nil
    log_out
redirect_to root_url
  end

end
