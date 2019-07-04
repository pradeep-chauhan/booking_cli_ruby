require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :seat do
    number { Faker::Alphanumeric.alpha 10 }
    entity_type { 'platinum' }
  end
end