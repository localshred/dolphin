require 'spec_helper'

describe Dolphin::Store::Redis do
  
  describe 'public API' do
    let(:opts) { {host: 'localhost', port: 12345} }
    subject { described_class.new(opts) }
    specify { subject.should respond_to(:enabled?) }
    specify { subject.should respond_to(:disabled?) }
    
    describe '#initialize' do
      it 'receives redis connection options and creates a source' do
        redis_mock = mock('redis cnxn')
        ::Redis.should_receive(:new).with(opts).and_return(redis_mock)
        store = described_class.new(opts)
        store.source.should eq redis_mock
      end
    end
  end
  
end