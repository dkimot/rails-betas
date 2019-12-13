module Betas
  class ExperimentRepo
    def initialize
      @betas = {}
    end

    def participating? beta_name, id
      @betas[beta_name].participating? id
    end

    def add name, desc, resolver
      @betas[name] = Beta.new name, desc, resolver
    end

    def find name
      @betas[name]
    end

    def all
      @betas.values
    end
  end
end
