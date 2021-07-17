require 'active_support/concern'

module OmniauthFacebook
  extend ActiveSupport::Concern

  included do
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
end
