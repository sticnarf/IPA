class AddRecruitmentInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :department, :string, array: true
    add_column :users, :photo_equipment, :string, array: true
    add_column :users, :post_software, :string, array: true
    add_column :users, :pub_skill, :string, array: true
    add_column :users, :film_post, :string, array: true
    add_column :users, :film_equipment, :string, array: true
    add_column :users, :hp_direction, :string, array: true
    add_column :users, :hp_tech, :string, array: true
  end
end
