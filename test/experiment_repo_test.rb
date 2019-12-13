require 'test_helper'
require 'experiment_repo'
require 'beta'
require 'resolvers/group'

module Betas
  class ExperimentRepoTest < ActiveSupport::TestCase
    def test_add_beta
      repo = new_repo
      repo.add :added_beta, "", Betas::Resolvers::Group.new([])

      assert_includes(
        repo.all,
        Beta.new(:added_beta, "", Betas::Resolvers::Group.new([])),
      )
    end

    def test_find_beta_by_name
      repo = new_repo
      repo.add :beta_to_find, "", Betas::Resolvers::Group.new([])

      assert_equal(
        Beta.new(:beta_to_find, "", Betas::Resolvers::Group.new([])),
        repo.find(:beta_to_find)
       )
    end

    def test_participating_by_name
      repo = new_repo
      repo.add :participatable_beta, "", Betas::Resolvers::Group.new(["my_id"])

      assert repo.participating? :participatable_beta, "my_id"
    end

    def test_participating_with_bad_name
      repo = new_repo

      assert repo.participating? :bad_name, "my_id"
    end

    def test_list_all_betas
      repo = new_repo
      repo.add :beta_a, "", Betas::Resolvers::Group.new([])
      repo.add :beta_b, "", Betas::Resolvers::Group.new([])
      repo.add :beta_c, "", Betas::Resolvers::Group.new([])

      all_betas = repo.all

      assert_equal 3, all_betas.length
      assert_includes all_betas, Beta.new(:beta_a, "", Betas::Resolvers::Group.new([]))
    end

    private

    def new_repo
      Betas::ExperimentRepo.new
    end
  end
end
