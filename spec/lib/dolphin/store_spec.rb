require 'spec_helper'

describe Dolphin::Store do
  describe 'public API' do
    specify { subject.should respond_to(:default) }
    
    describe '.default' do
      it 'should return a default redis-based dolphin store' do
        Dolphin::Store.default.should be_an_instance_of(Dolphin::Store::Redis)
      end
    end
  end
end