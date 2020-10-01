class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  # Associations
  has_many :user_servers
  has_many :servers, through: :user_servers
  has_many :user_room_messages
  has_many :rooms, through: :user_room_messages

  # Validations
  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
end
