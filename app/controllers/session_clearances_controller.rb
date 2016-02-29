class SessionClearancesController < Clearance::SessionsController
  layout "sign_in"

  def new
    @user = User.new 
  end

	def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
      	flash[:notice] = "You are successfully Log In"
        #redirect_back_or url_after_create
        redirect_to root_path
      else
      	flash.now[:error] = status.failure_message
        render "new", status: :unauthorized
      end
    end
  end

end
