require 'test/test_helper'

module Betas
  module Resolvers
    class PercentageTest < ActiveSupport::TestCase
      total_participating = 0
      resolver = Percentage.new 0.1

      (0..9999).to_a.each_index do |idx|
        total_participating += 1 if resolver.participating? idx, :test
      end

      # ensure we are within 10% of the expected percentage (i.e. with an eligibility percentage of 10%
      # between 9% and 11% of tested range were eligible)
      error_rate = (total_participating / 1000.0) - 1
      assert error_rate.abs < 0.1
    end
  end
end