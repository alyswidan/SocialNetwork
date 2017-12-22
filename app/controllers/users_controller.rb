class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index ,:edit, :update,:destroy]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("first_name DESC")
    else
      @users = User.all.order("first_name DESC")
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    page = params[:page] || 1
    @posts = @user.posts.order(created_at: :desc).paginate(page:page)
    # for create new post form
    @post = helpers.current_user.posts.build if helpers.logged_in?
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      helpers.log_in @user
      login_url @user
      flash[:success] = "Welcome #{@user.full_name}"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
     flash[:success] = "Profile updated"
     redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:sucess] = "User deleted"
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname,
                                 :password, :password_confirmation, :email, :gender,
                                 :marital_status, :birthdate, :about_me, :picture)
  end

  def logged_in_user
    unless helpers.logged_in?
      #helpers.store_location
      flash[:danger] = "please log in"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless helpers.current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless helpers.current_user.admin?
  end
end
