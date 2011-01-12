module DuplicateCatcher

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def add_word args
      create(args) if find_by_word(args[:word]).nil?
    end

    def add_name args
      create(args) if find_by_name(args[:name]).nil?
    end

  end
end