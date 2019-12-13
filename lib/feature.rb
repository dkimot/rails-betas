# frozen_string_literal: true

module CanaryLabs
  class Feature
    attr_reader :name, :description

    def initialize(name, desc, participation_resolver)
      @name = name
      @description = desc
      @participation_resolver = participation_resolver
    end

    def participating? identifier
      @participation_resolver.participating? identifier
    end

    def == other
      return false unless other.is_a? self.class

      other.name == self.name
    end
  end
end
