require 'test_helper'
require 'experiment_repo'
require 'feature'
require 'resolvers/group'

module CanaryLabs
  class ExperimentRepoTest < ActiveSupport::TestCase
    def test_add_beta
      repo = new_repo
      repo.add :added_beta, '', CanaryLabs::Resolvers::Group.new([])

      assert_includes(
        repo.all,
        Feature.new(:added_beta, '', CanaryLabs::Resolvers::Group.new([])),
      )
    end

    def test_find_beta_by_name
      repo = new_repo
      repo.add :beta_to_find, '', CanaryLabs::Resolvers::Group.new([])

      assert_equal(
        Feature.new(:beta_to_find, '', CanaryLabs::Resolvers::Group.new([])),
        repo.find(:beta_to_find)
       )
    end

    def test_participating_by_name
      repo = new_repo
      repo.add :participatable_beta, '', CanaryLabs::Resolvers::Group.new(['my_id'])

      assert repo.participating? :participatable_beta, 'my_id'
    end

    def test_participating_with_bad_name
      repo = new_repo

      assert repo.participating? :bad_name, 'my_id'
    end

    def test_list_all_betas
      repo = new_repo
      repo.add :beta_a, '', CanaryLabs::Resolvers::Group.new([])
      repo.add :beta_b, '', CanaryLabs::Resolvers::Group.new([])
      repo.add :beta_c, '', CanaryLabs::Resolvers::Group.new([])

      all_betas = repo.all

      assert_equal 3, all_betas.length
      assert_includes all_betas, Feature.new(:beta_a, '', CanaryLabs::Resolvers::Group.new([]))
    end

    private

    def new_repo
      CanaryLabs::ExperimentRepo.new
    end
  end
end
