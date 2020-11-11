class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :allow_without_password, only: [:update, :update_profile]
  before_action :set_request_foreign, only: [:create, :update]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.role = @role
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      @user.role = @role
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def show_profile
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    if !params[:user][:password].blank?

      @user = current_user
      if @user.update_with_password(user_params)
        # Sign in the user by passing validation in case their password changed
        bypass_sign_in(@user)
        redirect_to show_profile_path, notice: 'You was successfully change profile.'
      else
        render "edit_profile"
      end
    else
      @user = current_user
      if @user.update(user_params)
        # Sign in the user by passing validation in case their password changed
        bypass_sign_in(@user)
        redirect_to show_profile_path, notice: 'You was successfully change profile.'
      else
        render "edit_profile"
      end

    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    def set_request_foreign
      @role = Role.friendly.find(params[:user][:role_id])
    end

    # Only allow a list of trusted parameters through.
    def update_user_params
      params.require(:user).permit(:email, :username, :nip, :ktp, :honorific, :first_name, :last_name, :academic_degree,:date_birth,:gender,:postal_code,:address,:rt_number,:rw_number,:medical_staff,:password, :password_confirmation, :current_password)
    end

    def user_params
      params.require(:user).permit(:email, :username, :nip, :ktp, :honorific,:avatar, :first_name, :last_name, :academic_degree,:date_birth,:gender,:postal_code,:address,:rt_number,:rw_number,:medical_staff,:password, :password_confirmation)
    end

    def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
        params[:user].delete(:current_password)
      end
    end
end
