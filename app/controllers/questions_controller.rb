class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at desc")
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(title: params[:question][:title], body: params[:question][:body], user_id: current_user.id)

    if @question.valid?
      @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    unless @question.answers.nil?
      @question.answers.each do |answer|
        answer.destroy
      end
    end
    @question.destroy
    flash[:notice] = "Question Deleted"
    redirect_to root_path
  end

  def update
    @question = Question.update(params[:id], title: params[:question][:title], body: params[:question][:body])
    if @question.valid?
      redirect_to @question, notice: "You have updated the question!"
    else
      render :edit
    end
  end
end
