require "dolphin/version"
require 'dolphin/store'

module Dolphin
  extend self

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
    if !st.kind_of?(Dolphin::Store::Base) or st.instance_of?(Dolphin::Store::Base)
      raise Dolphin::Store::InvalidStoreException.new("Store of type #{st.class.name} is not supported. Please use an extended object of Dolphin::Store::Base.")
    end
    @store = st 
  end
  
end
