json.extract! user, :id, :name, :leader_namae, :phone_number, :email, :level_type, :password_digest, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
