require 'redis'
require 'dolphin/store/base'

module Dolphin
  module Store
    class Redis < Dolphin::Store::Base
      
      def initialize(opts)
        super(::Redis.new(opts))
      end
      
      def enabled?(feature)
      end
      
      def disabled?(feature)
      end
      
    end
  end
end
