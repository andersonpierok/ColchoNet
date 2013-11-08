class User < ActiveRecord::Base
  attr_accessible :bio, :email, :full_name, :location, :password, :password_confirmation


  validates :email, :full_name, :location, presence: true
  validates :bio, allow_blank: false, length: {minimum: 30}
  validates :email, format: {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :email, uniqueness: true
  
  has_secure_password

  before_create :generate_token

  scope :confirmed, where('confirmed_at IS NOT NULL')

  def self.authenticate(email, password)
    confirmed.
      find_by_email(email).
      try(:authenticate, password)
  end

  def generate_token
  	self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
  	return if confirmed?
  	self.confirmed_at = Time.current
  	self.confirmation_token = ''
  	save!
  end

  def confirmed?
  	confirmed_at.present?
  end

end
