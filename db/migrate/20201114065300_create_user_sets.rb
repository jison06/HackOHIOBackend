class CreateUserSets < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sets do |t|
      t.references :user_deck, foreign_key: true
      t.timestamp :completed_at
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
