module Betas
  module Resolvers
    class Group
      def initialize group
        @group = group.map do |member|
          member = member.downcase if member.is_a? String

          member.to_sym
        end
      end

      def participating? id
        id = id.downcase.to_sym if id.is_a? String

        @group.include? id
      end
    end
  end
end