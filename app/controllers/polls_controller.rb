class PollsController < ApplicationController

  def new
    @polls = Poll.all
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    if params[:poll][:estado] == "-1"
      flash[:alert] = "Tenemos tu comentario y trabajaremos para mejorar!!"
    else
      flash[:success] = "Gracias por tu respuesta!!!"
    end
    redirect_to root_path
  end


  private
    def poll_params
      params.require(:poll).permit(:nombre, :fnacimiento, :estado, :rut, :genero, :motivo)
    end

end
