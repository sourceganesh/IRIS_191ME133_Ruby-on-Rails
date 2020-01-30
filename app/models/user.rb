class User < ApplicationRecord
  validates :name, presence: true,
  uniqueness: {case-sensitive: false},
  length: {minimum: 3, maximum: 25}
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT },
  uniqueness: {case-sensitive: false}
  length: {minimum: 3, maximum: 75}
end
