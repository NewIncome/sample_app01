class User < ApplicationRecord

  validates :name, presence: true, length: { in: 6..25 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_secure_password
end
