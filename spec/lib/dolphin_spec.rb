require 'spec_helper'

describe Dolphin do
  subject { Dolphin }
  describe 'public API' do
    specify { subject.should respond_to(:enable) }
    specify { subject.should respond_to(:enabled?) }
    specify { subject.should respond_to(:disable) }
    specify { subject.should respond_to(:disabled?) }
    specify { subject.should respond_to(:store) }
    specify { subject.should respond_to(:store=) }
    
    describe '.enabled?' do
      context 'when given feature is enabled' do
        it 'returns true' do
          Dolphin.store.should_receive(:enabled?).with(:feature).and_return(true)
          Dolphin.enabled?(:feature).should be_true
        end
        
        context 'when block is given' do
          it 'invokes block' do
            value = 1
            Dolphin.store.should_receive(:enabled?).with(:feature).and_return(true)
            Dolphin.enabled?(:feature) do
              value = 5
            end
            value.should eq 5
          end
        end
      end
      
      context 'when given feature is not enabled' do
        it 'returns false' do
          Dolphin.store.should_receive(:enabled?).with(:feature).and_return(false)
          Dolphin.enabled?(:feature).should be_false
        end
        
        context 'when block is given' do
          it 'does not invoke block' do
            value = 1
            Dolphin.store.should_receive(:enabled?).with(:feature).and_return(false)
            Dolphin.enabled?(:feature) do
              value = 5
            end
            value.should eq 1
          end
        end
      end
      
      context 'when given feature is not known' do
        it 'returns false' do
          Dolphin.store.should_receive(:enabled?).with(:feature).and_return(false)
          Dolphin.enabled?(:feature).should be_false
        end
        
        context 'when block is given' do
          it 'does not invoke block' do
            value = 1
            Dolphin.store.should_receive(:enabled?).with(:feature).and_return(false)
            Dolphin.enabled?(:feature) do
              value = 5
            end
            value.should eq 1
          end
        end
      end
    end
    
    describe '.disabled?' do
      context 'when given feature is enabled' do
        it 'returns false' do
          Dolphin.store.should_receive(:disabled?).with(:feature).and_return(false)
          Dolphin.disabled?(:feature).should be_false
        end
      end
      
      context 'when given feature is not enabled' do
        it 'returns true' do
          Dolphin.store.should_receive(:disabled?).with(:feature).and_return(true)
          Dolphin.disabled?(:feature).should be_true
        end
      end
      
      context 'when given feature is not known' do
        it 'returns true' do
          Dolphin.store.should_receive(:disabled?).with(:feature).and_return(true)
          Dolphin.disabled?(:feature).should be_true
        end
      end
    end
    
    describe '.store=' do
      context 'when assigning an errant object' do
        it 'raises an exception' do
          expect { Dolphin.store = Hash.new }.should raise_error(Dolphin::Store::InvalidStoreException)
        end
      end
      
      context 'when assigning an instance of Dolphin::Store::Base' do
        it 'raises an exception' do
          expect { Dolphin.store = Dolphin::Store::Base.new }.should raise_error(Dolphin::Store::InvalidStoreException)
        end
      end
      
      context 'when assigning a subclass of Dolphin::Store::Base' do
        it 'assigns the object' do
          redis = Dolphin::Store::Redis.new
          Dolphin.store = redis
          Dolphin.store.should eq redis
        end
      end
    end
    
  end
end