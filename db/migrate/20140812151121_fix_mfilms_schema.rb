class FixMfilmsSchema < ActiveRecord::Migration
  def change
    remove_column :mfilms, :integer
    remove_column :mfilms, :priority
    add_column :mfilms, :priority, :integer, default: 0
  end
end
