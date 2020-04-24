class User < ApplicationRecord
  attr_accessor :remember_token # 6)to have r/w access to the remember_token
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { in: 6..25 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  # allow_nil is to allow not inputting password when only editing i.e. user name/mail

  has_secure_password

  # The following (6) methods are needed to be able to manipulate
  # a permament session with a permanent cookie via a the remember_digest
  # new column in the Users table.

  # 1) create a random new token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 2) creates a safe_hashed version of a string/token
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 3) Remembers a user in the DB by the remember_digest for persistent sessions
  def remember
    remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 4) Returns true if the given remember_token matches the digest.
  def authenticated?(rem_token)
    return false if remember_digest.nil? # this is to not even test if it doesn't exist
    BCrypt::Password.new(remember_digest).is_password?(rem_token)
  end

  # 5) Forget a remember_digest to delete a permamnent session
  def forget
    update_attribute(:remember_digest, nil)
  end

end
