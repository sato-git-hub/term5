class User < ApplicationRecord
  has_secure_password
  has_many :documents, dependent: :destroy
  validates :password, length: { minimum: 5 }
end
