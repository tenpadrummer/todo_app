class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i

  with_options presence: true, uniqueness: true do |e|
    e.validates :name
    e.validates :email, format: { with: EMAIL_REGEX }
  end

  validates :password,  presence: true, format: { with: PASSWORD_REGEX }
end
