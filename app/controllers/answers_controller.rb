# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_question!
  before_action :set_answer!, except: :create

  def edit; end

  def create
    @answer = @question.answers.build answer_params
    if @answer.save
      flash[:success] = t('.success')
      redirect_to question_path(@question)
    else
      @question = @question.decorate
      @pagy, @answers = pagy Answer.order(created_at: :desc)
      @answers = @answers.decorate
      render 'questions/show'
    end
  end

  def update
    if @answer.update answer_params
      flash[:success] = t('.success')
      redirect_to question_path(@question, anchor: "answer-#{@answer.id}")
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = t('.success')
    redirect_to question_path(@question)
  end

  private

  def set_question!
    @question = Question.find params[:question_id]
  end

  def set_answer!
    @answer = @question.answers.find params[:id]
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
