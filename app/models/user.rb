class User < ApplicationRecord
  include UserAuthentication

  # Validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_many :friends
end
