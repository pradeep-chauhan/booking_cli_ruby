require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'movies_development')

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

require_relative '../app/models/concerns/seat_attributes'
require_relative '../app/models/application_record'
require_relative '../app/models/booking'
require_relative '../app/models/screen'
require_relative '../app/models/seat'
# require_relative '../spec/spec_helper'
# require_relative '../spec/factories/screens'
# require_relative '../spec/factories/seats'
# require_relative '../spec/models/screen_spec'
# require_relative '../spec/support/screen_helper'
