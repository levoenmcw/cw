class UsersController < ApplicationController
#before_action :logged_in_user, only: [:edit, :update]
before_action :correct_user,   only: [:edit, :update]
before_action :logged_in_user, only: [:index, :edit, :update]

def index
@users = User.paginate(page: params[:page])
end  

def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "Welcome to the Clear Water!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
def edit
#@user = User.find(params[:id])
end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


private
def user_params
params.require(:user).permit(:name, :email, :password, :password_confirmation)

end

    # Before filters

    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url, notice: "Please log in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end


