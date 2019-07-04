require_relative '../config/environment.rb'
require_relative '../config/constant.rb'
require 'json'

@screens = Screen.all

def show_audies
  @screens.each_with_index do |screen, index|
    display_audi_details(screen, index)
  end
end

def display_audi_details(screen, index)
  puts "Show #{index+1} Running in #{screen.name}:"
  add_space
  puts "All Seats:"
  display_platinum_seats screen.platinum_seats
  display_gold_seats screen.gold_seats
  display_silver_seats screen.silver_seats
end

def display_platinum_seats seats
  add_space
  puts "Platinum"
  puts "#{seats.pluck(:number).join(" ")}"
end

def display_gold_seats seats
  add_space
  puts "Gold"
  puts "#{seats.pluck(:number).join(" ")}"
end

def display_silver_seats seats
  add_space
  puts "Silver"
  puts "#{seats.pluck(:number).join(" ")}"
  puts "==========================="
  add_space
end

def add_space
  puts ""
end

def check_audi_availability(audi_number)
  selected_audi = get_selected_audi(audi_number)
  if selected_audi.nil?
    puts "You have enter wrong audi"
  else
    book_ticket(audi_number, selected_audi)
  end
end

def get_selected_audi audi_number
  @screen = Screen.find_by(name: "Audi #{audi_number}")
end

def book_ticket audi_number, selected_audi
  puts "Enter seats:"
  input = gets.strip
  selected_seats = input.upcase.split(",")
  if check_seats_availability(audi_number, selected_seats)
    confirm_ticket(audi_number, selected_seats)
  end
end

def is_platinum?(seat)
  @screen.platinum_seats.find_by(number: seat.strip).entity_type == 'platinum'
end

def is_gold?(seat)
  @screen.gold_seats.find_by(number: seat.strip).entity_type == 'gold'
end

def is_silver?(seat)
  @screen.silver_seats.find_by(number: seat.strip).entity_type == 'silver'
end

def check_seats_availability(audi_number, selected_seats)
  booking_ids = Booking.booked_seats(@screen.id)
  selected_seats.each do |ss|
    seat = @screen.seats.where(number: ss.strip).last
    if !@screen.seats.pluck(:number).include?(ss.strip)
      puts "#{ss} Not available, Please select different seats"
      return false
    elsif booking_ids.to_a.include?(seat.id)
      puts "#{ss} seat is already booked, Please select different seats"
      return false
    end
  end
  return true
end

def confirm_ticket(audi_number, seats)
  tickets_amount = []
  seats.each do |s|
    if is_platinum?(s.strip)
      tickets_amount.push(PLATINUM_SEAT_PRICE)
    elsif is_gold?(s.strip)
      tickets_amount.push(GOLD_SEAT_PRICE)
    else
      tickets_amount.push(SILVER_SEAT_PRICE)
    end
  end
  puts "Successfully Booked - Show #{audi_number}"
  generate_bill(tickets_amount, seats)
  booking_reports
end

def generate_bill tickets_amount, seats
  sub_total = 0
  service_tax = 0.0
  swachh_bharat_tax = 0.0
  krishi_kalyan_tax = 0.0
  tickets_amount.each do |amt|
    sub_total = sub_total + amt.to_f
  end
  service_tax = (sub_total.to_f * 14.0) / 100
  swachh_bharat_tax = (sub_total.to_f * 0.5) / 100
  krishi_kalyan_tax = (sub_total.to_f * 0.5) / 100

  @booking = Booking.create(screen_id: @screen.id, booked_on: Date.today.to_s ,seat_ids: Seat.where(number: seats, screen_id: @screen.id).pluck(:id), amount: sub_total, service_tax: service_tax, swachh_bharat_cess: swachh_bharat_tax, krishi_kalyan_cess: krishi_kalyan_tax)

  puts "*** Booking Details ***"
  puts "SubTotal: Rs. #{@booking.amount}"
  puts "Service Tax @14%: Rs. #{@booking.service_tax}"
  puts "Swachh Bharat Cess @0.5%: Rs. #{@booking.swachh_bharat_cess}"
  puts "Krishi Kalyan Cess @0.5%: Rs. #{@booking.krishi_kalyan_cess}"
  puts "Total: Rs. #{@booking.total_amount}"
  puts "***************"
end

def booking_reports
  add_space
  puts "<<<<<<<< Daily booking reports >>>>>>>>>"
  puts "Total Sales:"
  puts "Revenue: Rs. #{Booking.all.sum(:amount)}"
  puts "Service Tax: Rs. #{Booking.all.sum(:service_tax)}"
  puts "Swachh Bharat Cess: Rs. #{Booking.all.sum(:swachh_bharat_cess)}"
  puts "Krishi Kalyan Cess: Rs. #{Booking.all.sum(:krishi_kalyan_cess)}"
  puts "<<<<<<< End >>>>>>>>>"
end