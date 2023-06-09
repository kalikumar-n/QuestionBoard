class QuestionsController < ApplicationController
  before_action :authenticate_user
  skip_before_action :verify_authenticity_token
  before_action :set_question, only: [:show, :update, :destroy]

  def index
    @questions = @current_user.questions.all
    QuestionMailer.mail_questions(@current_user.email, @questions).deliver_now
    render json: QuestionSerializer.new(@questions, ).serialized_json, status: :ok
  end

  def show
    if @question.present?
      render json: @question, status: :ok
    else
      render json: {errors: 'Not found' }, status: :not_found
    end
  end

  def create
    @question = @current_user.questions.build(question_params)

    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def create_questions_from_csv
    csv_data = params[:file].read
    user_id  = @current_user.id
    count    = 0
    CSV.parse(csv_data, headers: true) do |row|
      question = Question.new(title: row['Title'], description: row['Description'], user_id: user_id)
      count+= 1 if question.save
    end
    render json: { total_questions_added: count }, status: :created
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
    params.permit(:title, :description, :file)
  end
end
