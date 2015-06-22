class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at desc")
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(title: params[:question][:title], body: params[:question][:body])
    if @question.valid?
      @question.save
      redirect_to "/questions/#{@question.id}"
    else
      render :new
    end
  end

end
