class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    user ||= create_user(auth)
    user
  end

  def create_user(auth)
    last_name, first_name = auth.info.name.split(' ')
    User.create!(provider: auth.info.provider, uid: auth.info.uid, last_name: last_name, first_name: first_name,
                 email: auth.info.email, password: Devise.friendly_token[0, 20])
  end
end
