require 'redis'
require 'dolphin/store/base'

module Dolphin
  module Store
    class Redis < Dolphin::Store::Base
      
      # KEY_PATTERN = /^#{KEY_PREFIX}\:([^:]+)(\:#{CONDITIONAL_POSTFIX})?/.freeze
      
      def initialize(opts)
        super(::Redis.new(opts))
      end
      
      def enable(name, conditions={})
        value = ENABLED
        unless conditions.empty?
          conditionalize(name, conditions) 
          value = CONDITIONAL
        end
        k = key(name)
        source.set(k, value)
      end
      
      def disable(name)
        source.del(key(name))
      end
      
      def features
        source.keys("#{FEATURE_KEY_PREFIX}:*").map{|k| k.gsub(FEATURE_KEY_PREFIX+':', '') }
      end
      
      def enabled?(name, conditions={})
        case source.get(key(name))
        when ENABLED then true
        when CONDITIONAL then enabled_with_conditions?(name, conditions)
        when nil then false
        else false
        end
      end
      
      def disabled?(name)
        !enabled?(name)
      end
      
      def enabled_with_conditions?(name, conditions={})
        hash_k = key(name, true)
        keys = source.hkeys(hash_k)
        conditions.each_pair do |field,v|
          found = source.hget(hash_k, field)
          return false if found != v
          keys.delete(field.to_s)
        end
        keys.empty? ? true : false
      end
      
      def conditionalize(name, conditions={})
        k = key(name, true)
        params = conditions.collect{|k,v| [k,v] }
        source.hset(k, *params.flatten)
      end
      
      def key(name, conditional=false)
        k = conditional ? [CONDITIONAL_KEY_PREFIX] : [FEATURE_KEY_PREFIX]
        (k << name).join(':')
      end
      
    end
  end
end
