require 'test_helper'
require 'feature'
require 'resolvers/group'

class CanaryLabsTest < ActiveSupport::TestCase
  setup do
    CanaryLabs.setup
  end

  def test_truth
    assert_kind_of Module, CanaryLabs
  end

  def test_add_feature
    CanaryLabs.add :added_feat, '', CanaryLabs::Resolvers::Group.new([])

    assert_includes(
      CanaryLabs.all,
      CanaryLabs::Feature.new(:added_feat, '', CanaryLabs::Resolvers::Group.new([])),
    )
  end

  def test_find_feature_by_name
    CanaryLabs.add :feat_to_find, '', CanaryLabs::Resolvers::Group.new([])

    assert_equal(
      CanaryLabs::Feature.new(:feat_to_find, '', CanaryLabs::Resolvers::Group.new([])),
      CanaryLabs.find(:feat_to_find),
    )
  end

  def test_participating_by_name
    CanaryLabs.add :feat, '', CanaryLabs::Resolvers::Group.new(['my_id'])

    assert CanaryLabs.participating? :feat, 'my_id'
  end

  def test_participating_with_bad_name
    assert CanaryLabs.participating? :bad_name, 'my_id'
  end

  def test_list_all_feats
    CanaryLabs.add :feat_a, '', CanaryLabs::Resolvers::Group.new([])

    all_feats = CanaryLabs.all

    assert_includes all_feats, CanaryLabs::Feature.new(:feat_a, '', CanaryLabs::Resolvers::Group.new([]))
  end
end
