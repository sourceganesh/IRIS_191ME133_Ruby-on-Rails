class User < ApplicationRecord
  has_many :products
  before_save { self.email = email.downcase }
  validates :name, presence: true,
  uniqueness: {case_sensitive: false},
  length: { minimum: 3, maximum: 25 }
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT },
  uniqueness: {case_sensitive: false},
  length: {minimum: 3, maximum: 75}
end
