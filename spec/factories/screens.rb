require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :screen do
    name { Faker::Alphanumeric.alpha 10 }
  end
end