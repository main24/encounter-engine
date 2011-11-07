class TeamToUserMigration < ActiveRecord::Migration
  def self.up
    rename_column :game_entries, :team_id, :user_id
    rename_column :game_passings, :team_id, :user_id
    rename_column :games, :max_team_number, :max_user_number
    rename_column :games, :requested_teams_number, :requested_users_number
    rename_column :logs, :team, :user
  end

  def self.down
    rename_column :game_entries, :user_id, :team_id
    rename_column :game_passings, :user_id, :team_id
    rename_column :games, :max_user_number, :max_team_number
    rename_column :games, :requested_users_number, :requested_teams_number
    rename_column :logs, :user, :team
  end
end
