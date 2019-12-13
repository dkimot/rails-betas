module CanaryLabs
  class ExperimentRepo
    attr_reader :default_participation

    def initialize default_participation: true
      @betas = {}
      @default_participation = default_participation
    end

    def participating? beta_name, id
      b = @betas[beta_name]

      return @default_participation if b.nil?

      b.participating? id
    end

    def add name, desc, resolver
      @betas[name] = Feature.new name, desc, resolver
    end

    def find name
      @betas[name]
    end

    def all
      @betas.values
    end
  end
end
