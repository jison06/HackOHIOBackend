# json.data do
#   json.array! @decks do |deck|
#     json.id deck.id
#     json.name deck.name
#     json.difficulty deck.difficulty
#     json.user_sets deck.user_sets do |set|
#       json.user_cards set.user_cards
#     end
#   end
# end

def difficulty(category_id)
  if category_id == 1
    'easy'
  elsif category_id == 2
    'medium'
  else
    'hard'
  end
end

json.data do
  json.array! @saved_sets do |set|
    json.user_deck_id set.user_deck_id
    json.deck_name set.user_deck.name
    json.difficulty difficulty(set.user_cards.max_by { |user_card| user_card.card.category_id }.card.category.id)
  end
end
