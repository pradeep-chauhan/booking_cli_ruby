namespace :screen do
  desc "Load screens and seats"
  task custom_seed: :environment do
    # load(File.read("db/seeds.rb"))
    first_screen = Screen.find_or_create_by(name: 'Audi 1')
    second_screen = Screen.find_or_create_by(name: 'Audi 2')
    third_screen = Screen.find_or_create_by(name: 'Audi 3')

    #First screen seats
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'A1', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'A2', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'A3', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'A4', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'A5', entity_type: 'platinum')

    Seat.find_or_create_by(screen_id: first_screen.id, number: 'B1', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'B2', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'B3', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'B4', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'B5', entity_type: 'gold')

    Seat.find_or_create_by(screen_id: first_screen.id, number: 'C1', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'C2', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'C3', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'C4', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: first_screen.id, number: 'C5', entity_type: 'silver')

    #Second screen seats
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'A1', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'A2', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'A3', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'A4', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'A5', entity_type: 'platinum')

    Seat.find_or_create_by(screen_id: second_screen.id, number: 'B1', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'B2', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'B3', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'B4', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'B5', entity_type: 'gold')

    Seat.find_or_create_by(screen_id: second_screen.id, number: 'C1', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'C2', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'C3', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'C4', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: second_screen.id, number: 'C5', entity_type: 'silver')

    #Third screen seats
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'A1', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'A2', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'A3', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'A4', entity_type: 'platinum')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'A5', entity_type: 'platinum')

    Seat.find_or_create_by(screen_id: third_screen.id, number: 'B1', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'B2', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'B3', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'B4', entity_type: 'gold')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'B5', entity_type: 'gold')

    Seat.find_or_create_by(screen_id: third_screen.id, number: 'C1', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'C2', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'C3', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'C4', entity_type: 'silver')
    Seat.find_or_create_by(screen_id: third_screen.id, number: 'C5', entity_type: 'silver')
  end
end