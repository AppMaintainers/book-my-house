# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'database_cleaner/active_record'

# Clear DB
DatabaseCleaner[:active_record].strategy = :truncation
DatabaseCleaner[:active_record].clean

House.create(name: 'Summer house', city: 'Badacsonytomaj')
House.create(name: 'Flat', city: 'Budapest')
House.create(name: 'Family house', city: 'Győr')

5.times do |i|
  Booking.create(day: Time.zone.today + i.days, house: House.all.sample)
end
