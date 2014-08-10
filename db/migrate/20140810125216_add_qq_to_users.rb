class AddQqToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qq, :string
  end
end
