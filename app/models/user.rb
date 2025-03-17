class User < ApplicationRecord
  has_many :entries
  has_many :places, through: :entries

  has_secure_password # Enables bcrypt password hashing

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, if: -> { new_record? || !password.nil? }

end
