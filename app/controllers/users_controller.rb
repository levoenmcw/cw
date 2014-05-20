class UsersController < ApplicationController
  
before_action :logged_in_user, only: [:index, :edit, :update, :show]
before_action :correct_user,   only: [:edit, :update]
#before_action :admin_user,     only: :destroy

def index
#@users = User.paginate(page: params[:page])
#@users = User.paginate :page => params[:page], :per_page => 10, :order => 'name ASC'
#@users = User.paginate(page: params[:page, :per_page => 10, :order => 'name ASC'])
@users = User.paginate(:page => params[:page], :per_page => 4)
#User.paginate(page: 1, :per_page => 8).each do |user|
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
      
      flash.now[:success] = "Successful login: Welcome to the Clear Water!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
def edit
 @user = User.find(params[:id])
end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


private
def user_params
params.require(:user).permit(:user_name, :email, :password, :password_confirmation)

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


