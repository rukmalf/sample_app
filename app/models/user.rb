class User < ActiveRecord::Base

  # contrary to what the tutorial says, we do need all four of these
  attr_accessible  :name, :email, :password, :password_confirmation
  
  # save callback
  before_save { self.email = email.downcase }
  
  # name attribute and validations
  validates :name, presence: true, length: { maximum: 50 }
  
  # email attribute and validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # secure password functionality and password minimum length validation
  has_secure_password
  validates :password, length: { minimum: 6 }  
end
