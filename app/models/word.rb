require 'duplicate_catcher'

class Word < ActiveRecord::Base
  include DuplicateCatcher
  belongs_to  :universe
  has_friendly_id :word, :use_slug => true
  before_validation :titleizer
  validates_presence_of :word, :universe_id
  validates_uniqueness_of :word, :scope => :universe_id
  
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
    sentence.first.word.capitalize! #Make it titleize this once to start the paragraph, but don't save to the DB
    sentence
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
  
  def address
    website ? website : "http://en.wikipedia.org/wiki/#{word.titleize}"
  end

  private
  
  def titleizer
    self.word = word.gsub('_',' ').upcase if is_acronym
    self.word = word.gsub('_',' ').titleize if is_name
  end
  
end
