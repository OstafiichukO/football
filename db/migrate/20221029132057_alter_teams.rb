class AlterTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :number_of_wins, :integer
  end
end
