class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :bio, :instagram_user_name, :birth_date, :distance_mi
  cache_options enabled: true, cache_length: 160.seconds
end
