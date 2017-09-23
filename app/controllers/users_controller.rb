class UsersController < ApplicationController
  def index
  	@users = User.paginate(per_page: 8, page: params[:page])
  	respond_to do |format|
    	format.html
    	format.js
  	end
  end
end
