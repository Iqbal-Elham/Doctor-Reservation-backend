class User < ApplicationRecord
  validates :username, uniqueness: { case_sensitive: false, error: "We already have this username in the database." }
end
