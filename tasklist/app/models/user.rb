class User < ApplicationRecord
  has_many :errands
  validates :username, :password, presence: true
  has_secure_password
end
