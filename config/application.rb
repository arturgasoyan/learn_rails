require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LearnRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

config.before_configuration do
  env_file = File.join(Rails.root, 'config', 'local_env.yml')
  YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end if File.exists?(env_file)
end
=begin
if Rails.env.development?
  config.action_mailer.smtp_settings = {
      user_name: ENV["GMAIL_USERNAME_DEV"]
  }
end

if Rails.env.test?
  config.action_mailer.smtp_settings = {
      user_name: ENV["GMAIL_USERNAME_TEST"]
  }
end

if Rails.env.production?
  config.action_mailer.smtp_settings = {
      user_name: ENV["GMAIL_USERNAME"]
  }
end
=end
