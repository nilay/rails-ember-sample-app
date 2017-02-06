class Friend < ApplicationRecord

  belongs_to :user

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { scope: [:user_id] }

end
