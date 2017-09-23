class UsersController < ApplicationController
  def index
  	@users = User.paginate(per_page: 8, page: params[:page])
  	@user = User.new
  	respond_to do |format|
    	format.html
    	format.js
  	end
  end

  def create
	  @user = User.create!(allowed_params)
	  puts "*****************************"
	  puts @user
	  respond_to do |f|
	    #f.html { redirect_to tasks_url }

	    f.js
	  end
	end

	private

  def allowed_params
    params.require(:user).permit(:name, :status)
  end

end
