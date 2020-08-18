class User < ApplicationRecord
  before_save do
    self.email = email.downcase
  end
  has_many :blogs, dependent: :destroy
  has_many :pets, dependent: :destroy
  validates :user_name,
            presence: true,
            length: { minimum: 3, maximum: 25 },
            uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/
  validates :email,
            presence: true,
            length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
