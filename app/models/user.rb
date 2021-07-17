class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  include OmniauthFacebook

  validates :email, :first_name, :last_name, presence: true
  validates_format_of :email, with: Devise.email_regexp
end
