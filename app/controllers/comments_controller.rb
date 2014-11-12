class CommentsController < ApplicationController
  def new
  	@story = Story.find(params[:story_id])
  	@comment = @story.comments.new

  end

  def create 
  	@story = Story.find(params[:story_id])
  	@comment = story.comments.new(comment_params)

  	if @comment.save
  		flash[:success] = "Yay!"
  		redirect_to story_path(@comment.story)
  	else 
  		flash[:error] = "Boo"
  		render :new
  	end
  end

	private
	def comment_params
		params.require(:comment).permit(:body, :story_id)

	end
end