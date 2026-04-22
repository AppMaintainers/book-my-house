# Deterministic seed data for the interview project.
# Known answers:
#   Most popular house: "City Flat" (15 bookings)
#   Most successful year: 2025 (25 bookings)
#   Average bookings per house: 7.9 (63 bookings / 8 houses)

houses = {
  "Summer Cottage"    => "Badacsonytomaj",
  "City Flat"         => "Budapest",
  "Family House"      => "Gyor",
  "Lake View"         => "Balatonfured",
  "Mountain Lodge"    => "Eger",
  "Studio Apartment"  => "Pecs",
  "Garden Villa"      => "Sopron",
  "Riverside Cabin"   => "Szeged"
}

created_houses = houses.map do |name, city|
  House.find_or_create_by!(name: name) { |h| h.city = city }
end

house = ->(name) { created_houses.find { |h| h.name == name } }

# Booking data: [house_name, [dates]]
# Distribution:
#   City Flat:         15 bookings (most popular)
#   Summer Cottage:    10 bookings
#   Family House:       9 bookings
#   Lake View:          8 bookings
#   Mountain Lodge:     7 bookings
#   Studio Apartment:   6 bookings
#   Garden Villa:       5 bookings
#   Riverside Cabin:    3 bookings
#   Total:             63 bookings
#
# Year distribution:
#   2023:  8 bookings
#   2024: 15 bookings
#   2025: 25 bookings (most successful)
#   2026: 15 bookings

bookings = [
  # City Flat — 15 bookings (most popular house)
  [ "City Flat", %w[
    2023-03-10 2023-07-20
    2024-01-15 2024-04-20 2024-06-10 2024-08-15
    2025-01-10 2025-03-15 2025-05-20 2025-07-25 2025-09-10 2025-11-05
    2026-02-14 2026-05-01 2026-08-20
  ]],

  # Summer Cottage — 10 bookings
  [ "Summer Cottage", %w[
    2023-06-15 2023-08-10
    2024-06-20 2024-07-15 2024-08-25
    2025-06-10 2025-07-20 2025-08-15
    2026-06-15 2026-07-25
  ]],

  # Family House — 9 bookings
  [ "Family House", %w[
    2023-04-10 2023-12-20
    2024-03-15 2024-09-10
    2025-02-14 2025-04-20 2025-08-30
    2026-01-10 2026-04-15
  ]],

  # Lake View — 8 bookings
  [ "Lake View", %w[
    2023-07-01
    2024-05-15 2024-07-20
    2025-05-10 2025-06-25 2025-07-15
    2026-03-20 2026-06-10
  ]],

  # Mountain Lodge — 7 bookings
  [ "Mountain Lodge", %w[
    2023-01-15
    2024-01-20 2024-12-22
    2025-01-05 2025-02-20 2025-12-28
    2026-01-15
  ]],

  # Studio Apartment — 6 bookings
  [ "Studio Apartment", %w[
    2024-02-10 2024-10-05
    2025-03-10 2025-09-15
    2026-03-05 2026-09-10
  ]],

  # Garden Villa — 5 bookings
  [ "Garden Villa", %w[
    2025-04-10 2025-06-15 2025-10-20
    2026-04-20 2026-07-10
  ]],

  # Riverside Cabin — 3 bookings
  [ "Riverside Cabin", %w[
    2025-05-01 2025-08-20
    2026-05-15
  ]]
]

bookings.each do |house_name, dates|
  dates.each do |date|
    Booking.find_or_create_by!(house: house.(house_name), day: Date.parse(date))
  end
end

puts "Seeded #{House.count} houses and #{Booking.count} bookings."
