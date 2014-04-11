json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :category, :name, :point, :question, :solution
  json.url challenge_url(challenge, format: :json)
end
