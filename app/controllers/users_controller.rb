class UsersController < ApplicationController

	helper_method :get_question

	def show
		@user = User.find(params[:id])
		@questions = @user.questions.all.all
		@answers = @user.answers
		# session[:user_id] = @user.id
	end

	def update
		@user = User.find(params[:id])
		@user.introduction = params[:user][:introduction]
		@user.save
		redirect_to @user
	end

	def following
	    @user = User.find(params[:id])
	    render @user
  	end

  	def followers
	    @user = User.find(params[:id])
	    render @user
  	end

	private

		def get_question(id)
			@question ||= Question.find(id)
		end 

		def user_params
			params.require(:user).permit(:introduciton)
		end

		def ranking(score)
			@user ||= User.all.order(socre).only(5) 
		end
end
