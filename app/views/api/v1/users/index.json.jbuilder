# frozen_string_literal: true

json.users do
  json.array! @users do |user|
    json.first_name user.first_name
    json.last_name user.last_name
    json.username user.username
    json.email user.email
    json.score user.score
    json.created_at user.created_at
    json.updated_at user.updated_at
  end
end
