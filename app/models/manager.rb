require 'duplicate_catcher'

class Manager < ActiveRecord::Base
  include DuplicateCatcher

  has_many  :universes
  
  has_many  :universe_managers
  has_many  :helped, :through => :universe_managers
  before_validation :downcase!
  
  private
  
  def downcase!
    self.name = name.downcase.gsub(' ','_') if attribute_present?("name")
  end
  
end
