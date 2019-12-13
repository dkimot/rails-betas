require 'test_helper'

class BetaTest < ActiveSupport::TestCase
  attr_accessor :beta

  setup do
    self.beta = Betas::Beta.new(
      :can_opt_in,
      'You can opt your company in to betas.',
      Betas::Resolvers::Percentage.new(0.1, :can_opt_in)
    )
  end

  def test_beta_has_name
    assert_equal :can_opt_in, beta.name
  end

  def test_beta_has_description
    assert_equal 'You can opt your company in to betas', beta.desc
  end

  def test_beta_has_resolver
    assert beta.resolver.is_a? Betas::Resolvers::Percentage
  end
end