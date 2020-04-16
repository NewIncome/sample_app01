class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { in: 6..25 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
