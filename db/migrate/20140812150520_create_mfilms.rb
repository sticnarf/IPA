class CreateMfilms < ActiveRecord::Migration
  def change
    create_table :mfilms do |t|
      t.string :url
      t.string :name
      t.string :poster
      t.string :priority
      t.string :integer

      t.timestamps
    end
  end
end
