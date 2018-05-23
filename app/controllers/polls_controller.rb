class PollsController < ApplicationController
  def new
    @polls = Poll.all
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.save
    redirect_to root_path
  end


  private
    def poll_params
      params.require(:poll).permit(:nombre, :apellido, :estado, :rut, :genero, :motivo)
    end

end
