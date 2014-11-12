class AddDefaultToStoriesVotesCount < ActiveRecord::Migration
  def change
  	change_column :stories, :votes_count, :integer, default: 0
  end
end 
