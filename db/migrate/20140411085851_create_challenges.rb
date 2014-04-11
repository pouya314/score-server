class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :category
      t.string :name
      t.integer :point
      t.text :question
      t.text :solution

      t.timestamps
    end
  end
end
