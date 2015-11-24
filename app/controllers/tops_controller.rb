class TopsController < ApplicationController

	helper_method :ranking

    def index
        @top = 'top'
        @questions = Question.all.order('updated_at').paginate(page: params[:page])
        @tags = ActsAsTaggableOn::Tag.most_used(5)
    end

    private

    	def ranking(score)
    		@rank ||= User.order(score).limit(5)
    	end
end