class AddPriorityToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :priority, :integer, default: 0
  end
end
