json.data do
  json.user_deck_id @deck.id
  json.user_set_id @deck.user_sets.first.id
  json.cards @user_deck.each do |card|
    json.id card.id
    json.workout card.workout
    json.description card.description
  end
end
