class HomesController < ApplicationController
  before_action :require_login, only: :show

  def index
  end

  def show
  end

  def cover
  	render "homes/cover"
  end

  def about 
  	render "homes/about"
  end

  def contact 
  	render "homes/contact_us"
  end
end
