drwho = Universe.find_by_name("doctor_who")

##############
## Proper Nouns
%w(Doctor First_Doctor Second_Doctor Third_Doctor Fourth_Doctor Fifth_Doctor Sixth_Doctor Seventh_Doctor Eighth_Doctor Ninth_Doctor Tenth_Doctor Eleventh_Doctor Susan_Foreman Ian_Chesterton Barbara_Wright Vicki_Pallister Steven_Taylor Katarina Sara_Kingdom Dodo_Chaplet Polly_Wright Ben_Jackson Jamie_McCrimmon Victoria_Waterfield Zoe_Heriot Liz_Shaw Jo_Grant Sarah_Jane_Smith Harry_Sullivan Leela K-9_Mark_I K-9_Mark_II Romana_I Romana_II Adric Nyssa Tegan_Jovanka Vislor_Turlough Kamelion Peri_Brown Jamie_McCrimmon Melanie_Bush Dorothy_"Ace"_McShane Grace_Holloway Rose_Tyler Adam_Mitchell Captain_Jack_Harkness Lynda_Moss Mickey_Smith Jackie_Tyler Donna_Noble Martha_Jones Astrid_Peth Jenny Christina_de_Souza Adelaide_Brooke Wilfred_Mott Amy_Pond Rory_Williams River_Song Time_Lord Time_Lords Gallifrey Dalek The_Master Torchwood Ood Cybermen Sontaran Judoon Sycorax Adipose Hath Slitheen Black_Dalek Supreme_Dalek Davros Eternals Ephemerals Face_of_Boe Gelth Nanogenes Blon_Fel-Fotch_Passameer-Day_Slitheen Jocrassa_Fel-Fotch_Passameer-Day_Slitheen Sip_Fel-Fotch_Passameer-Day_Slitheen Henry_van_Statten Jagrafess Mighty_Jagrafess_of_the_Holy_Hadrojassic_Maxarodenfoe Reapers Anne_Droid Trine-E Zu-Zana Davinadroid  Dalek_Sec Dalek_Caan Dalek_Thay Dalek_Jast Empress_of_the_Racnoss Racnoss Roboforms Carrionites Catkind Weeping_Angels Pyrovile Sibylline_Sisterhood BBC Torchwood England Cardiff Wales Skaro Kaled Rani Yeti Silurians Dominators Sea_Devils Rutons Zygons Rani Haemovores Faction_Paradox Grandfather_Paradox The_Enemy Genesis_Ark Cult_of_Skaro Cybus_Cybermen Cybusmen Rutan Mutter's_Spiral Psychevore The_456 Alpha_Centauran Atraxi Balumin Benelisan Berserker Boekind Charon Chula Cineraria Cthalctose Cyberon Dark Dalek_Empire_Demon Eyeless Garynth Gastronaut Gastropod Gell_guard Horsegoon Husk Jal_Karath Jixen Killoran Krashok Lords_of_Jelsen Lupine_Wavelength_Haemovariform Malevilus Meron Monan_Host Morpho Myloki Nekkistani Pipe_Person Plasmaton Posicarian Prison_Guard The_Forgotten Quarsian Ranfo The_Remote Rill Sentient_Iron Shadeys Skeleton_Crew Sontar_Sand_Shrews Terpsivore Tractite Vashta_Nerada Viyran Voracious_Craw Vortisaur Vromyx Warfreek Wurm 
).each{ |word| Word.create(:word => word, :universe_id => drwho.id, :is_name => true) }

##############
## Acronyms
%w(TARDIS).each{ |word| Word.create(:word => word, :universe_id => drwho.id, :is_acronym => true) }

##############
## Regular Words
%w(screwdriver call_box TARDIS_key companion aliens time_travel planets space_travel tv_show tv_series television_show science_fiction sci-fi comics radio_dramas specials novels DVDs travel suit sneakers 3-D_glasses sonic_screwdriver scarf celery cricket_uniform alien 
).each{|word| Word.create(:word => word, :universe_id => drwho.id)}




