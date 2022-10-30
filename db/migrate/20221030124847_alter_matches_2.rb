class AlterMatches2 < ActiveRecord::Migration[7.0]
  def change
    change_column :matches, :home_team_score, :integer, :default => 0
    change_column :matches, :visitor_team_score, :integer, :default => 0
  end
end
