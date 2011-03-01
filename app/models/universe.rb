require 'duplicate_catcher'
class Universe < ActiveRecord::Base
  include DuplicateCatcher
  
  belongs_to  :genre
  belongs_to  :manager
  has_friendly_id :name, :use_slug => true
  has_many :universe_managers
  has_many :helpers, :through => :universe_managers
  has_many :words
  has_many :phrases

  before_validation :titleizer
  validates_uniqueness_of :name
  validates_presence_of :name, :genre_id

  def self.one
    Universe.find(:all, :order => 'random()', :offset => (Universe.count * rand).to_i, :limit => 1)[0]
  end

  def address
    website ? website : "http://en.wikipedia.org/wiki/#{name}"
  end
  
  def words
    Word.find_all_by_universe_id(self.id)
  end
  
  def count
    words ? words.count : 0
  end
  
  private
  
  def titleizer
    self.name = name.gsub('_',' ').titleize
  end
  
end
