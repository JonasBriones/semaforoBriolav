class FeedbacksController < ApplicationController

  def index
    @polls = Poll.where("state_id > 1")
  end

  def new
    logger.debug params.inspect
    @poll = Poll.find_by_id(params[:id])
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save
    flash[:success] = "Se envio tu respuesta!!!"
    redirect_to feedbacks_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:poll_id, :enviado_por, :respuesta)
  end

end
