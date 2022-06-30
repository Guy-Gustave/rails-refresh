class User < ApplicationRecord
  has_secure_password
  # validates :email, presence: true format: {with: /\A[^@\s]+@[^@\s]+\z/, message => "email must be valid" }
  validates :password, presence: true
end
