class UserMigration < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :crypted_password
      t.string :salt
      t.boolean :is_master, :default=>false
      t.timestamps
    end

  User.create :email=>"andrew@intelsport.ru", :name=>"andrew_master", :is_master=>true, :password=>"not_simple_password", :password_confirmation=>"not_simple_password"
  end


  def self.down
    drop_table :users
  end
end
