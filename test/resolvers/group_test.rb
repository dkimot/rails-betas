require 'test_helper'
require 'resolvers/group'

module Betas
  module Resolvers
    class GroupTest < ActiveSupport::TestCase
      def test_participating
        resolver = Group.new ['admin_id', :dev_id, :qa_id, 'beta_lover_id']
        id_participating_pairs = {
          'admin_id' => true,
          :dev_id => true,
          'qa_id' => true,
          :beta_lover_id => true,
          'boring_customer_id' => false,
        }

        id_participating_pairs.each do |id, participating|
          assert_equal participating, resolver.participating?(id)
        end
      end
    end
  end
end