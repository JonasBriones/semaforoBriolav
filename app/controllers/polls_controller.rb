class PollsController < ApplicationController

  def index
    @estado = State.includes(:polls).group(:id).pluck( "states.descripcion, count(polls.id)" )
    @genero = Poll.group(:genero).count
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.save
    flash[:success] = "Gracias por tu respuesta!!!"
    redirect_to root_path
  end


  private
    def poll_params
      params.require(:poll).permit(:nombre, :fnacimiento, :state_id, :rut, :genero, :motivo)
    end

end
