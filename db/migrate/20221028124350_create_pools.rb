class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.integer :home_team_score
      t.integer :visitor_team_score
      t.timestamps
    end

    add_foreign_key :pools, :matches, column: :home_team_score
    add_foreign_key :pools, :matches, column: :visitor_team_score
  end
end
