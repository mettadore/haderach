require 'duplicate_catcher'

class Word < ActiveRecord::Base
  include DuplicateCatcher
  extend FriendlyId
  friendly_id :word, :use => :slugged

  belongs_to :universe
  before_validation :titleizer
  validates_presence_of :word, :universe_id
  validates_uniqueness_of :word, :scope => :universe_id
  
  scope :by_universe, lambda { |universe|
    where(:universe == universe)
  }

  def self.some univ = nil
    if univ
      where(:universe_id => univ.id).order('random()')[0..rand(10) + 5]
    else
      order('random()')[0.. rand(10) + 5]
    end
  end

  def self.one
    first :order => 'random()', :offset => (Word.count * rand).to_i, :limit => 1
  end
  
  def self.sentence univ = nil
    sentence = univ ? self.some(univ = univ) : self.some
    sentence.first.word.capitalize! #Make it titleize this once to start the paragraph, but don't save to the DB
    sentence
  end
  
  def self.paragraph min = 20, univ = nil
    para = []
    count = 0
    while count < min
      para << self.sentence(univ = univ)
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
