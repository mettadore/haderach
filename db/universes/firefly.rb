M2 = Manager.new(:name => "Michael Fessler", :website => "http://twitter.com/technorav")
Universe.add_name(:name => "firefly", :website => "http://en.wikipedia.org/wiki/Firefly_%28TV_series%29", :genre_id => scifi.id, :manager_id => M2.id)

firefly = Universe.find_by_name("firefly")

# Proper Nouns
%w{serenity mal wash river simon inara zoe kaylee jayne shepherd_book reavers earth-that-was ariel badger
   niska saffron firefly browncoat alliance companion crazy_ivan vera jayne's_day core cortex the_rim 
   the_'verse miranda dortmunder}.each{ |word| Word.add_word(:word => word, :universe_id => firefly.id, :is_name => true) }

# Acronyms
%w{iav}.each{ |word| Word.add_word(:word => word, :universe_id => firefly.id, :is_name => true) }

# regular words
%w{gorram brain_pan shiny ornery cussing creepifying shindig nethers leaf_on_the_wind feller all-fired plumb
   powerful bang-up preacher run_afoul tetchy atmo the_black bushwhack hornswoggle skyplex wave full_burn vesselside
    oldtech newtech cry_baby}.each{ |word| Word.add_word(:word => word, :universe_id => firefly.id) }
