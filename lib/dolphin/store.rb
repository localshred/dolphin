require 'dolphin'
require 'dolphin/store/redis'

module Dolphin
  module Store
    extend self
    
    class InvalidStoreException < StandardError; end
    
    DEFAULT_OPTIONS = {
      host: 'localhost',
      port: 6379
    }
    
    def default
      Dolphin::Store::Redis.new(DEFAULT_OPTIONS)
    end
    
  end
end