# Add the name of the universe manager and a website to link to
manager_name = ""
manager_website = ""
# Add Universe's name and a website (Wikipedia is a good default)
# Genre should be either "Science Fiction" or "Fantasy"
genre = "" # Either "Science Fiction" or "Fantasy"
universe_name = ""
universe_website = ""

########################################
## Skip down to Words section
MAN = Manager.new(:name => manager_name, :website => manager_website)
MAN.save!
Universe.add_name(:name => universe_name, 
                  :website => universe_website, 
                  :genre_id => Genre.find_by_name(genre).id, 
                  :manager_id => MAN.id)
univ = Universe.find_by_name(univer_name.downcase.gsub(' ','_'))
#########################################

########################################
## Words section

# Add words separated by spaces, if there are spaces within the words, replace them with underscores

#############
## Proper nouns
%w{
}.each{ |word| Word.add_word(:word => word, :universe_id => univ.id, :is_name => true) }

##############
## Acronyms
%w{
}.each{ |word| Word.add_word(:word => word, :universe_id => univ.id, :is_acronym => true) }

##############
## Regular Words
%w{
}.each{|word| Word.add_word(:word => word, :universe_id => univ.id)}
