class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_question, only: [:show, :update, :destroy]
  def index
    @questions = @current_user.questions.all
    render json: @questions, status: :ok
  end

  def show
    render json: @question, status: :ok
  end

  def create
    @question = @current_user.questions.build(question_params)

    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      render json: @question, status: :accepted
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
  end

  private

  def set_question
    @question = Question.find_by(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
