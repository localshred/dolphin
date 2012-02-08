require 'spec_helper'

describe Dolphin::Store::Redis do
  
  
  let(:opts) { {host: 'localhost', port: 6379} }
  let(:subject) { described_class.new({host: 'localhost', port: 6379}) }
  before(:each) { subject.source.keys('*').each{|k| subject.source.del(k) } }
  
  it_behaves_like 'a dolphin store', subject
  
  describe '#initialize' do
    it 'receives redis connection options and creates a source' do
      redis_mock = mock('redis cnxn')
      ::Redis.should_receive(:new).with(opts).and_return(redis_mock)
      store = described_class.new(opts)
      store.source.should eq redis_mock
    end
  end
  
  describe '#key' do
    it 'builds a dolphin redis key for the given feature' do
      subject.key(:my_feature).should eq 'dolphin:feature:my_feature'
    end
    
    context 'when conditional is false' do
      it 'builds a normal key' do
        subject.key(:my_feature).should eq 'dolphin:feature:my_feature'
      end
    end
    
    context 'when conditional is true' do
      it 'builds a conditional key' do
        subject.key(:my_feature, true).should eq 'dolphin:conditions:my_feature'
      end
    end
  end
  
  describe '#enabled?' do
    context 'when source returns an unexpected value' do
      it 'is false' do
        subject.source.should_receive(:get).with('dolphin:feature:my_feature').and_return('invalid value')
        subject.enabled?(:my_feature).should be_false
      end
    end
  end
  
end