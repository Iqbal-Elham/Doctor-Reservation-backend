class User < ApplicationRecord
  has_many :reservations
  validates :username, uniqueness: { case_sensitive: false }
end
