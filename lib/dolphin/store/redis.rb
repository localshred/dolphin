require 'dolphin/store/base'

module Dolphin
  module Store
    class Redis < Base
      def initialize
      end
      
      def enabled?(feature)
      end
      
      def disabled?(feature)
      end
    end
  end
end
