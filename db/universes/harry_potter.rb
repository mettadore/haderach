potter = Universe.find_by_name("harry_potter")

##############
## Proper Nouns
%w(beauxbatons droobles durmstrang erised gringotts grunnings gryffindor 
harry_potter hedwig hogsmeade hogwarts hufflepuff pigwidgeon quidditch ravenclaw
slytherin albus_dumbledore minerva_mcgonagall severus_snape hermione_granger ron_weasley
ginny_weasley lord_voldemort tom_riddle
).each{ |word| Word.create(:word => word, :universe_id => potter.id, :is_name => true) }

##############
## Acronyms
%w(NEWT OWL
).each{ |word| Word.create(:word => word, :universe_id => potter.id, :is_acronym => true) }

##############
## Regular Words
%w(alohomora animagi animagus apparate avada_kedavra azkaban
basilisk beater bezoar bludger boggart bubotuber
chaser codswallop
dementor disapparate dungbomb floo_powder exploding_snap 
galleon gillyweed gnome grim hinkypunk hippogriff howler hungarian_horntail
kappa keeper knut kwikspell lumos mandrake marauders_map morsemordre mudblood muggle
parseltounge patronus quaffle remembrall seeker sickle snitch squib triwizard_tournament
veela venemous_tentacula veritaserum whomping_willow
).each{|word| Word.create(:word => word, :universe_id => potter.id)}
