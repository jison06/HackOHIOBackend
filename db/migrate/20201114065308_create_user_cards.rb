class CreateUserCards < ActiveRecord::Migration[6.0]
  def change
    create_table :user_cards do |t|
      t.references :user_set, foreign_key: true
      t.references :card, foreign_key: true
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
