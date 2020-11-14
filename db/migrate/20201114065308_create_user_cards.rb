class CreateUserCards < ActiveRecord::Migration[6.0]
  def change
    create_table :user_cards do |t|
      t.integer :weight, null: false, default: 0
      t.references :user_deck, foreign_key: true
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
