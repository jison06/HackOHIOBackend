class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :deck, foreign_key: true
      t.string :workout
      t.string :description
      t.integer :weight, null: false, default: 0

      t.timestamps
    end
  end
end
