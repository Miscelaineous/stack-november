class StoriesController < ApplicationController

	def index
		if params[:sort] and params [:sort] == "top" #something is true then ...
			@stories = Story.order("votes_count DESC")
		else
			@stories = Story.order("created_at DESC")
		# @title = ["Hello world", "Another title", "yet another title"]
		# @body = ["body copy", "body 2", "body 3"]
		end
	end

	def show
		@story = Story.find(params[:id]) # find the 5th story
		@votes = @story.votes # votes method possible because of story.rb reference to has_many :votes
	end


	def new
		@story = Story.new
	end

# check understanding of create method


	def create
		@story = Story.new(story_params)

		if @story.save
			flash[:success] = "Thanks for sharing"
			redirect_to story_path(@story)
		else
			flash[:error] = "Oops, sorry, something went wrong"
			render :new
		end
	end


	def edit
		@story = Story.find(params[:id])
	end

	def update
		@story = Story.find(params[:id])

		if @story.update(story_params)
			flash[:success] = "Thanks, your story was updated"
			redirect_to story_path(@story)
		else
			flash[:error] = "Oops, sorry, something went wrong"
			render :edit
		end
	end


	def destroy
	end

	private  # method is only applicable within this file, public is accessible outside of this file
	def story_params
		params.require(:story).permit(:title, :body, :url, :author)
	end

end


# use this order all the time

	# def index
	# end

	# def show
	# end

	# def new
	# end

# CRUD 

	# def create
	# end

	# def edit (revise)
	# end

	# def update
	# end

	# def destroy
	# end
