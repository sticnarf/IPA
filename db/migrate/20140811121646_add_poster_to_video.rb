class AddPosterToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :poster, :string
  end
end
