class FeedbacksController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @poll = Poll.find_by_id(params[:id])
    @feedback = Feedback.new
    render layout: 'dashboard'
  end

  def create
    @feedback = Feedback.new(feedback_params)
    user = User.joins(:polls).select("users.id").where("polls.id = #{feedback_params[:poll_id]}").group('users.id').first
    flash[:success] = "Se envio tu respuesta!!!"
    @feedback.save
    redirect_to poll_path(user.id)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:poll_id, :enviado_por, :respuesta)
  end

end
