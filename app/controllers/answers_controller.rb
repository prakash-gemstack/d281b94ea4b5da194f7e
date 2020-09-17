class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params.merge(user: current_user))
    redirect_to question_path(@question), alert: @answer.errors.full_messages.join(',') and return unless @answer.save

    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
