module CanaryLabs
  module Resolvers
    class Group
      def initialize group
        @group = group
      end

      def participating? id
        @group.include? id
      end
    end
  end
end