class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :score, null: false, default: 0
      t.string :difficulty

      t.timestamps
    end
  end
end