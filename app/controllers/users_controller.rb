class UsersController < ApplicationController
  def index
  end

  def show
  	@user = current_user
    render :layout => false
  end

  def edit
  	@user = current_user
  end

  def sign_in
  	 @user = user_from_params
  	 if @user.save
      sign_in @user
      redirect_back_or url_after_create, :notice => "You are sucessfully Log In!"
    else 
      render template: "users/new", :error => "Invalid input, Please Try again"
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  	  redirect_to user_path(:id => current_user.id), :notice => "Your account have been updated!"
  	else
  	  render "edit", :error => "Invalid Input, Please try again!"
  	end
  end

  private 
  def user_params 
    params.require(:user).permit(:name, :email, :password)
  end
end