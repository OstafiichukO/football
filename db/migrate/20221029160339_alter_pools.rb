class AlterPools < ActiveRecord::Migration[7.0]
  def change
    change_column :pools, :home_team_score, :integer, :default => 0
    change_column :pools, :visitor_team_score, :integer, :default => 0
  end
end
