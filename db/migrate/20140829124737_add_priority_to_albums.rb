class AddPriorityToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :priority, :integer, :default => 0
  end
end
