class AddIsFeaturedStories < ActiveRecord::Migration
  def change
  	add_column :stories, :is_featured, :boolean, default: false
  end
end
