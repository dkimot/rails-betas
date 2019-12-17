require 'test_helper'

class FeatureTest < ActiveSupport::TestCase
  attr_accessor :beta

  setup do
    self.beta = CanaryLabs::Feature.new(
      :can_opt_in,
      'You can opt your company in to canary_labs.',
      CanaryLabs::Resolvers::Percentage.new(0.1, :can_opt_in)
    )
  end

  def test_beta_has_name
    assert_equal :can_opt_in, beta.name
  end

  def test_beta_has_description
    assert_equal 'You can opt your company in to canary_labs.', beta.description
  end

  def test_beta_has_resolver
    assert_respond_to beta, :participating?
  end
end