require_relative '../support/spec_helper.rb'
require_relative '../factories/screens.rb'
require_relative '../factories/seats.rb'
require 'factory_bot'
require 'screen'

RSpec.describe Screen, type: :model do
  context 'associations' do
    it 'has many seats' do
      # holders
      @screen = FactoryBot.create(:screen)
      @seat = FactoryBot.create(:seats, screen_id: @screen.id)
      expect(@screen.seats).to be_valid
    end
  end

  context 'validations' do
    it 'should have a name' do
      # holders
      @screen = FactoryBot.create(:screen)
      @seat = FactoryBot.create(:seats, screen_id: @screen.id)
      @screen.name = nil
      expect(@screen).not_to be_valid
    end
  end
end