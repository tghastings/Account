class UserController < ApplicationController
 
  def index
    @users = User.excludes(:id => current_user.id)
  end
   
  def new
    unless admin_signed_in?
      redirect_to root_path
    end
    @user = User.new
  end
   
  def create
    unless admin_signed_in?
      redirect_to root_path
    end
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
   
  def edit
    @user = User.find(params[:id])
  end
   
  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def show
    if admin_signed_in?
        @user = User.find(params[:id])
        if @user.destroy
          flash[:notice] = "Successfully deleted User."
        end
      end
else 
  redirect_to :back
end
  
  
  def destroy
    if admin_signed_in?
        @user = User.find(params[:id])
        if @user.destroy
          flash[:notice] = "Successfully deleted User."
        end
      end
else 
  redirect_to :back
end
end
