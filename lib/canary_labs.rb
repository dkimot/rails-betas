require 'feature'

require 'resolvers/group'
require 'resolvers/percentage'

module CanaryLabs
  mattr_accessor :default_participation

  def self.setup default_participation: true
    @@experiments = {}
    @@default_participation = default_participation
  end

  def self.participating? feat_name, id
    experiment = @@experiments[feat_name]

    return @@default_participation if experiment.nil?

    experiment.participating? id
  end

  def self.add name, desc, resolver
    @@experiments[name] = Feature.new name, desc, resolver
  end

  def self.find name
    @@experiments[name]
  end

  def self.all
    @@experiments.values
  end
end
