class QuestionsController < ApplicationController

  def new
    if !logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to '/'
    else
      @question = Question.new
    end
  end

  def create
      @question = Question.new(question_params)
      @user = current_user
      @question.user_id = @user.id

      if @question.save
        redirect_to @question
      else
        render 'new'
      end
  end

  def show
      @question = Question.find(params[:id])
      @user = User.find(@question.user_id)
  end

  def index
    search_word = '%' + params[:question][:title] + '%'
    @questions = Question.find_by_sql(["SELECT * FROM Questions WHERE title LIKE ? or 
                                        description LIKE ? or code LIKE ?", 
                                        search_word, search_word, search_word])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      redirect_to 'edit'
    end
  end

  private

      def question_params
          params.require(:question).permit(:title, :description, :code, :theme, :tag, :test)
    end
end
