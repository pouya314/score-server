class AddCurrentScoreToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :current_score, :integer
  end
end
