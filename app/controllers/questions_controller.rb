class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @topics = Topic.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = current_user.questions.build(question_params)
    render 'new' and return unless @question.save

    redirect_to root_path, alert: @question.errors.full_messages.join(',')
  end

  private

  def question_params
    params.require(:question).permit(:question, :topic_id)
  end
end
