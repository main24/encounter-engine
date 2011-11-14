class AddFreeColumnToGameMigration < ActiveRecord::Migration
  def self.up
    add_column :games, :is_free, :boolean, :default => false
  end

  def self.down
    remove_column :games, :is_free
  end
end
