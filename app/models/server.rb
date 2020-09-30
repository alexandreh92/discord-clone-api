class Server < ApplicationRecord
  # Associations
  has_many :user_servers
  has_many :servers, through: :user_servers
  has_many :rooms
end
