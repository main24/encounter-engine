class AdditionalUserMigration < ActiveRecord::Migration
  def self.up
    add_column :users, :is_master, :boolean, :default => false
    rename_column :users, :nickname, :name

  User.create :email=>"master@example.com", :name=>"master", :is_master=>true, :password=>"not_simple_password", :password_confirmation=>"not_simple_password"
  end

  def self.down
    remove_column :users, :is_master
    rename_column :users, :name, :nickname    
    drop_table :users
  end
end
