class AddOriginNameToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :origin_name, :string
  end
end
