module Dolphin
  module Store
    class Base
      attr_reader :source
      
      ENABLED = 'ENABLE'.freeze
      CONDITIONAL = 'CONDITIONAL'.freeze
      
      FEATURE_KEY_PREFIX = 'dolphin:feature'
      CONDITIONAL_KEY_PREFIX = 'dolphin:conditions'
      
      def initialize(source)
        @source = source
      end
      
      def enabled?(feature)
        raise 'Not implemented'
      end
      
      def disabled?(feature)
        raise 'Not implemented'
      end
      
      def enable(feature, conditions={})
        raise 'Not implemented'
      end
      
      def disable(feature)
        raise 'Not implemented'
      end
      
      def features
        raise 'Not Implemented'
      end
      
      def conditionalize(feature, conditions={})
        raise 'Not implemented'
      end
      
    end
  end
end
