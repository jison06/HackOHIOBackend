class CreateUserSets < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sets do |t|
      t.references :user_card, foreign_key: true
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
