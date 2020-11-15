def difficulty(category_id)
  case category_id
  when '1'
    'easy'
  when '2'
    'medium'
  when '3'
    'hard'
  end
end

json.data do
  json.array! @saved_sets do |set|
    json.deck_name set.user_deck.name
    json.difficulty difficulty(set.user_cards.max_by { |user_card| user_card.card.category_id }.card.category.id)
    json.cards set.user_cards
  end
end
