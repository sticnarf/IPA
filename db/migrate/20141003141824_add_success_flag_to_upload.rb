class AddSuccessFlagToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :success, :boolean
    add_index :uploads, :name, :unique => true
  end
end
