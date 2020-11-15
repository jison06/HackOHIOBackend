json.data do
  json.array! @decks do |deck|
    json.id deck.id
    json.name deck.name
    json.difficulty deck.difficulty
    json.user_sets deck.user_sets do |set|
      json.user_cards set.user_cards
    end
  end
end
