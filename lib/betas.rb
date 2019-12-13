module Betas
  class Betas
    @@betas = {}

    def self.add name, desc, resolver
      @@betas[name] = Beta.new name, desc, resolver
    end
  end
end
