class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :challenge, index: true
      t.belongs_to :team, index: true

      t.timestamps
    end
  end
end
