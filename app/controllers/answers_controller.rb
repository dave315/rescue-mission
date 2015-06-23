class AnswersController < ActionController::Base
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(body: params[:answer][:body], question_id: @question.id, user_id: current_user.id )
    if @answer.save
      flash[:notice] = "Answer Added"
      redirect_to @question
    else
      flash[:alert] = "Failed to save answer"
      redirect_to @question
    end

  end

end
