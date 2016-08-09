class User < ApplicationRecord
  has_many :errands
  validates :user, :password, presence: true
  has_secure_password
end
