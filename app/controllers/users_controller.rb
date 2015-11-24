class UsersController < ApplicationController

	helper_method :get_question

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@questions = @user.questions.paginate(page: params[:page], per_page: 5)
		@answers = @user.answers.paginate(page: params[:page], per_page: 5)
	end

	def update
		@user = User.find(params[:id])
		@user.introduction = params[:user][:introduction]
		@user.save
		redirect_to @user
	end

	def following
	  @user = User.find(params[:id])
	  @users = @user.followed_users.paginate(page: params[:page])
		render 'show_follow'
	end

  def followers
	  @user = User.find(params[:id])
	  @users = @user.followers.paginate(page: params[:page])
	  render 'show_follow'
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
