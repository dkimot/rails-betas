require 'digest'

module Betas
  module Resolvers
    class Percentage
      def initialize(percentage)
        @percentage = percentage
      end

      def participating? id, beta_name
        # create a deterministic number based on the item identifier and
        # name of the beta. This will evenly distribute exposure to beta's
        # across all ID's.
        determ_num = Digest::MD5.hexdigest(id.to_s + beta_name).to_i(16)
        (determ_num % (@percentage * 100).to_i).zero?
      end
    end
  end
end