class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { in: 6..25 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  # create a random new token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # creates a safe_hashed version of a string/token
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Remembers a user in the DB by the remember_digest for persistent sessions
  def remember
    remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given remember_token matches the digest.
  def authenticated?(rem_token)
    return false if remember_digest.nil? # this is to not even test if it doesn't exist
    BCrypt::Password.new(remember_digest).is_password?(rem_token)
  end

  # Forget a remember_digest to delete a permamnent session
  def forget
    update_attribute(:remember_digest, nil)
  end

end
