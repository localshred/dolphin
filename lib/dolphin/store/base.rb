module Dolphin
  module Store
    class Base
      attr_reader :source
      
      def initialize(source)
        @source = source
      end
      
      def enabled?(feature)
        raise 'Not implemented'
      end
      
      def disabled?(feature)
        raise 'Not implemented'
      end
    end
  end
end
