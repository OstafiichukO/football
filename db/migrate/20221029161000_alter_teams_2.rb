class AlterTeams2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :number_of_wins
  end
end
