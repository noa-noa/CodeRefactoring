class RelationshipsController < ApplicationController
	
	def index
	end

	def create
	    answer = Answer.find(params[:relationship][:liked_id])
	   	user = User.find(answer.user_id)
	   	@question = Question.find(answer.question_id)

	    current_user.like!(answer)
	    answer.like += 1
	    case @question.theme
	    when 'Readable' then
	    	user.readable_score += 1
	    when 'Speed' then
	    	user.speed_score += 1
	    when 'Number of line' then
	    	user.row_score += 1
	    when 'Recyclable' then
	    	user.recyclable_score += 1
	    end

	    user.total += 1
	    
	    answer.save
	    user.save


		respond_to do |format|
      		format.html { redirect_to @question }
      		format.js { @answer = answer }
    	end
  	end
end
