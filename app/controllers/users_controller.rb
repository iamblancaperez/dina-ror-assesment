class UsersController < ApplicationController
  def index
  	@users = User.paginate(per_page: 8, page: params[:page])
  	@user = User.new
    @roles = Role.all
  	respond_to do |format|
    	format.html
    	format.js
  	end
  end

  def create
	  @user = User.create!(allowed_params)
	  respond_to do |f|
	    f.js
	  end
	end

	private

  def allowed_params
    params.require(:user).permit(:name, :status, :role_id)
  end

end
