class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :workout
      t.string :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
