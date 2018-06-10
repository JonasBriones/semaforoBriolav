class PollsController < ApplicationController

  def index
    @estado = State.includes(:polls).group(:id).pluck( "states.descripcion, count(polls.id)" )
    @genero = User.group(:genero).count
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
    @user.polls.build
  end

  def create
    if User.exists?( :rut => poll_create[:rut] )
      @user = User.find_by_rut( poll_create[:rut] )
      @user.update_attributes(poll_create)
      flash[:success] = "Usuario registrado, se agrega respuesta!!!"
    else
      @user = User.new(poll_create)
      @user.save
      flash[:alert] = "Usuario no registrado, se agrega respuesta!!!"
    end
    redirect_to root_path
  end


  private
    def poll_create
      params.require(:user).permit(:nombre, :fnacimiento, :rut, :genero, polls_attributes: [:state_id, :motivo, :user_id])
    end


end
