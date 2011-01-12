module DuplicateCatcher

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def add_word args
      lst = find_by_word(args[:word])
      if lst.length > 0
        return
      else 
        create(args)
      end        
    end

    def add_name args
      lst = find_by_name(args[:name])
      if lst.length > 0
        return
      else 
        create(args)
      end        
    end

  end
end