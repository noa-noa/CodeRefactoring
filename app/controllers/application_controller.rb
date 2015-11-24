class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  

  helper_method :logged_in?, :current_user, :get_user, 
                :current_user?, :get_question

  private

  	def logged_in?
  		!!session[:user_id]
  	end

  	def current_user
  		return unless session[:user_id]
  		@current_user ||= User.find(session[:user_id])
  	end

    def get_user(id)
        @user ||= User.find(id)
    end

    def current_user?(user)
        user == current_user
    end

    def get_question(id)
      @user ||= Question.find(id)
    end
end
