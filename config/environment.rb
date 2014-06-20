# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Sampleblog::Application.initialize!

Sampleblog::Application.configure do
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
		address:              'smtp.163.com',
		port:                 25,
		user_name:            'wliu272@163.com',
		password:             'ARMYKING_haha103',
		authentication:       :login
	}
	config.log_level = :debug
end
