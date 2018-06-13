class UsersController < ApplicationController

  def index
    @user = User.all
    render layout: 'dashboard'
  end

  def new
    @users = User.new
  end

  def search_user
    @user = User.find_by_rut(params[:rut])
      if @user != nil
        render :json => @user
      else
        render :json => { :errors => @user.errors }, :status => 422
      end
  end

end
