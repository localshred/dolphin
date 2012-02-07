module Dolphin
  module Store
    class Base
      def enabled?(feature)
        raise 'Not implemented'
      end
      
      def disabled?(feature)
        raise 'Not implemented'
      end
    end
  end
end
