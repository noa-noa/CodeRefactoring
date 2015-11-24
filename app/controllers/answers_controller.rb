class AnswersController < ApplicationController

	def create
		@question = Question.find(params[:question_id])
		if logged_in?
			@answer = @question.answers.create(answer_params)
			user = current_user
			@answer.user_id = user.id

			@answer.save
			redirect_to question_path(@question)
		else
			flash[:danger] = "ログインしてください"
			redirect_to question_path(@question)
		end
	end

	private
		def answer_params
			params.require(:answer).permit(:body);
		end
end