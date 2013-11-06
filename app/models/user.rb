class User < ActiveRecord::Base
  attr_accessible :bio, :email, :full_name, :location, :password, :password_confirmation


  validates :email, :full_name, :location, presence: true
  validates :bio, allow_blank: false, length: {minimum: 30}
  validates :email, format: {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :email, uniqueness: true
  
  has_secure_password
end
