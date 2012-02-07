require 'dolphin'
require 'dolphin/store/redis'

module Dolphin
  module Store
    extend self
    
    class InvalidStoreException < StandardError; end
    
    def default(*args)
      Dolphin::Store::Redis.new(*args)
    end
    
  end
end