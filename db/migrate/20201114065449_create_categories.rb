class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :user_deck, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
