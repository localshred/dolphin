require "dolphin/version"
require 'dolphin/store'
require 'dolphin/store/redis'

module Dolphin

  def enable(feature)
  end

  def disable(feature)
  end

  def enabled?(feature)
    if store.enabled?(feature)
      yield if block_given?
      true
    else
      false
    end
  end

  def disabled?(feature)
    if store.disabled?(feature)
      true
    else
      false
    end
  end
  
  def store
    @store ||= Dolphin::Store.default
  end
  
  def store=(st)
    @store = st
  end
  
  module_function :enable, :disable, :enabled?, :disabled?, :store
  
end
