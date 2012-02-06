require 'dolphin'
require 'dolphin/store/redis'

module Dolphin
  module Store
    def default(*args)
      Dolphin::Store::Redis.new(*args)
    end
    
    module_function :default
  end
end