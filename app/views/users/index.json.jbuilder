json.array!(@users) do |user|
  json.extract! user, :id, :username, :surname, :firstname, :email, :admin
  json.url user_url(user, format: :json)
end
