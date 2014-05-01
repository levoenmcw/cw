#FACEBOOK_CONFIG = YAML.load_file("#{::Rails.root}/config/facebook.yml")[::Rails.env]

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

provider :facebook, '242824305841355', 'fb9e454c38fdeaa364ef59a6c94f6842'

end
