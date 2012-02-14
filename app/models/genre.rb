require 'duplicate_catcher'
class Genre < ActiveRecord::Base
  include DuplicateCatcher

  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many  :universes
  
  validates_presence_of :name
  before_validation :titleize!

  private
  
  def titleize!
    self.name = name.titleize if attribute_present?("name")
  end
  

end
