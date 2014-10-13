# Load the Rails application.
require File.expand_path('../application', __FILE__)

config.gem 'mongo_mapper'

config.frameworks -= [:active_record]

# Initialize the Rails application.
Rails.application.initialize!
