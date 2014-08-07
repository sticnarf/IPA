class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :class_name, :string
    add_column :users, :user_type, :integer
  end
end
