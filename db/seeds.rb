# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
include Faker

abouts = %w(course, novel, tech)

50.times do

  art=Book.create( :name => "#{Faker::Lorem.words(rand(4))}",
                      :category => abouts[rand(3)],
                      :description => "#{Lorem.paragraphs.join("<br/>")}",
                      :author => "#{Name.first_name}"


  )

end