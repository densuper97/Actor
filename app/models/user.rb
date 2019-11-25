class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  has_one :manager
  has_one :actor
end
