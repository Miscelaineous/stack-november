class AddVoteCountsToStories < ActiveRecord::Migration
  def change

  	add_column :stories, :votes_count, :integer
  	add_index :stories, :votes_count
  end
end
