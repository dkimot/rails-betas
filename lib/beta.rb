# frozen_string_literal: true

module Betas
  class Beta
    attr_reader :name, :description

    def initialize(name, desc, participation_resolver)
      @name = name
      @description = desc
      @participation_resolver = participation_resolver
    end

    def participating? identifier
      @participation_resolver.participating? identifier, @name
    end
  end
end
