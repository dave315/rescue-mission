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
    @question = Question.new(title: params[:question][:title], body: params[:question][:body])
    if @question.valid?
      @question.save
      redirect_to @question
    else
      render :new
    end
  end

end
