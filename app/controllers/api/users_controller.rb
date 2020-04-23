class Api::UsersController < ApplicationController

  def index 
    render json: Users::Builder.new.build_index
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  rescue ActiveRecord::RecordNotFound => e
  	render json: {error: "User Not Found", status: 403}
  end

  def create
    @user = User.new(obj_params)
    if @user.save
      render json: @user
    else 
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(obj_params)
  	  render json: @user
  	else
  	  render json: {errors: @user.errors.full_messages}, status: 422
  	end
  rescue ActiveRecord::RecordNotFound => e
  	render json: {error: "User Not Found", status: 403}
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
  	  render json: {success: true}
  	else
  	  render json: {errors: @user.errors.full_messages}, status: 422
  	end
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: "User Not Found", status: 403}
  end


  private

  def obj_params
  	params.require(:user).permit(
  		:first_name, :last_name, :email, :role_id, :active_position_id
  	)
  end

end