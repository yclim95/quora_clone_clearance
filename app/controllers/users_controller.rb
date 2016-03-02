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

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  	  redirect_to user_path(:id => current_user.id), :notice => "Your account have been updated!"
  	else
      flash.now[:error] = "Invalid input, Please Try again"
  	  render "edit"
  	end
  end

  private 
  def user_params 
    params.require(:user).permit(:name, :email, :password)
  end
end