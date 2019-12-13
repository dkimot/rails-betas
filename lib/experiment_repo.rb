module Betas
  class ExperimentRepo
    @@betas = {}

    def self.add name, desc, resolver
      @@betas[name] = Beta.new name, desc, resolver
    end

    def self.find name
      @@betas[name]
    end

    def self.all
      @@betas.values
    end
  end
end
