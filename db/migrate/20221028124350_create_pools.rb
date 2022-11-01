class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.integer :home_team_score, :default => 0
      t.integer :visitor_team_score, :default => 0
      t.timestamps
    end

    add_reference :pools, :match, foreign_key: true
    add_reference :pools, :user, foreign_key: true
  end
end
