class CreateUserDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_decks do |t|
      t.string :name
      t.string :difficulty
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
