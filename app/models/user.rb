class User < ApplicationRecord
  validates :email, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
end
