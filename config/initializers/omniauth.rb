fb_credentials = Rails.application.credentials.facebook

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, fb_credentials[:app_id], fb_credentials[:app_secret],
           client_options: {
             site: 'https://graph.facebook.com/v11.0',
             authorize_url: 'https://www.facebook.com/v11.0/diaog/oauth'
           }
end
