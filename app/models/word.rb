class Word < ActiveRecord::Base
  belongs_to  :universe
  
  validates_presence_of :word, :universe_id
  before_validation :downcase!
        
  named_scope :by_universe, lambda { |universe| 
    { :conditions => {:universes =>{:name => universe}}}
  }

  def self.some universe = nil
    if universe
      Word.find :conditions => { :universes=>{:name => universe}}, :order => 'random()', :offset => (Word.count * rand).to_i, :limit => rand(10) + 5 
    else
      Word.find :all, :order => 'random()', :offset => (Word.count * rand).to_i, :limit => rand(10) + 5
    end
  end

  def self.one
    Word.find(:all, :order => 'random()', :offset => (Word.count * rand).to_i, :limit => 1)[0]
  end
  
  def self.sentence universe = nil
    sentence = self.some
    sentence.first.is_name = true #Make it titleize this once to start the paragraph, but don't save to the DB
    sentence
  end
  
  def add_word args
    if Word.find_by_name(args[:name])
      return
    else 
      Word.create(args)
    end
  end
  
  def self.paragraph min = 20, universe = nil
    para = []
    count = 0
    while count < min
      para << self.sentence(universe)
      count += para.last.count
    end
    para
  end
  
  def self.universes para
    universes = []
    para.each do |sentence|
      sentence.each do |word| 
        universes << word.universe
      end
    end
    universes.uniq
  end
  
  def proper
    if is_acronym
      word.upcase
    elsif is_name
      word.titleize
    else
      word.humanize.downcase
    end
  end
  
  def address
    website ? website : "http://en.wikipedia.org/wiki/#{word}"
  end

  private
  
  def downcase!
    self.word = word.downcase.gsub(' ','_') if attribute_present?("word")
  end
  
end
