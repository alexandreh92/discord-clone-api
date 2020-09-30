class UserServer < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :server
end
