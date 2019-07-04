module SpecHelper
  def holders
    @screen = FactoryBot.create(:screen)
    @seat = FactoryBot.create(:seat, screen_id: @screen.id)
  end
end