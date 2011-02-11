# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Manager.add_name(:name => "John Metta", :website => "http://mettadore.com")
M1 = Manager.new(:name => "Bill Jackson", :website => "http://twitter.com/wajiii")
M1.save!
M2.save!

%w(
science_fiction fantasy
).each{|genre| Genre.add_name(:name => genre) }

scifi = Genre.find_by_name("Science Fiction")
fantasy = Genre.find_by_name("Fantasy")

#%w(
#pern xanth elenium mists_of_avalon buffy_the_vampire_slayer narnia
#).each{ |univ| Universe.create(:name => univ, :genre_id => Genre.find_by_name("Fantasy")) }

#%w(
#star_wars star_trek Ender's_game discworld wild_cards
#).each{ |univ| Universe.create(:name => univ, :genre_id => scifi.id) }

Universe.add_name(:name => "dune", :website => "http://en.wikipedia.org/wiki/Dune_universe", :genre_id => scifi.id)
Universe.add_name(:name => "foundation", :website => "http://en.wikipedia.org/wiki/Foundation_series", :genre_id => scifi.id, :manager_id => M1.id)
Universe.add_name(:name => "ringworld", :genre_id => scifi.id, :manager_id => M1.id)
Universe.add_name(:name => "harry_potter", :genre_id => fantasy.id, :website => "http://en.wikipedia.org/wiki/Harry_Potter")

load 'db/universes/dune.rb'
load 'db/universes/doctor_who.rb'
load 'db/universes/harry_potter.rb'