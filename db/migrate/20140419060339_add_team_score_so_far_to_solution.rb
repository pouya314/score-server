class AddTeamScoreSoFarToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :team_score_so_far, :integer
  end
end
