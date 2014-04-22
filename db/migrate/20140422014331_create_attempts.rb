class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.string :team_name
      t.string :challenge_name
      t.text :submitted_answer
      t.boolean :was_correct_answer

      t.timestamps
    end
  end
end
