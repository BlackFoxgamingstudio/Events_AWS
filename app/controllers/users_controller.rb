class UsersController < ApplicationController
  def index
  end

  def create
  	user = User.new( user_params )
  	user.password_confirmation = params[:user][:c_password]
  	if user.valid?
  		user.save
  		session[:user_id] = user.id 
  		redirect_to "/events"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to "/"
  	end
  end

  def show
  end

  def edit
  	@user = User.find( session[:user_id] )
  end

  def update
  	user = User.find( session[:user_id] )
  	user.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], location: params[:user][:location], state: params[:user][:state])
  	if user.valid?
  		redirect_to "/events"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to "/users/#{user.id}/edit"
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :location, :state)
  	end
end
