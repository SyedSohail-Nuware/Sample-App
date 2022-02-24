class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
    :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def index
    @users = User.all
    # puts("/n/n/n INDEX CALLED_______-----------++++++++++===/n/n/n")
    # User.find(params[:id]).destroy
    # flash.now[:success] = "User deleted "
  end
  
  def new
    @user = User.new
    # puts("/n/n/n NEW CALLED_______-----------++++++++++===/n/n/n")
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    # puts("/n/n/nSSSSHHHHOOOWWW CALLED_______-----------++++++++++===/n/n/n")

    # debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
    render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    # @user = User.find(params[:id]).destroy
    # # @user.
    # # params[:id] = nil
    # flash.now[:success] = "User deleted "
    # redirect_to users_url
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
