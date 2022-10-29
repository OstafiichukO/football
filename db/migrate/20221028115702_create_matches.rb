class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.datetime :match_date
      t.string :stage
      t.bigint :home_team__id
      t.integer :home_team_score
      t.bigint :visitor_team__id
      t.integer :visitor_team_score
      t.timestamps
    end
    add_foreign_key :matches, :teams, column: :home_team__id
    add_foreign_key :matches, :teams, column: :visitor_team__id
  end
end