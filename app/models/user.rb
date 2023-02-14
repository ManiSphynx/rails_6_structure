class User < ApplicationRecord
  has_many :articles, dependent: :destroy # Prefer to use a flag to mark the record as deleted
  before_save { self.email = email.downcase }
  validates :username,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            length: {
              minimum: 3,
              maximum: 25
            }
  validates :email,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            length: {
              maximum: 105
            },
            format: {
              with: URI::MailTo::EMAIL_REGEXP
            }
  has_secure_password
end
