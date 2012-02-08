shared_examples_for "a dolphin store" do |store|
  let(:feature_name) { :my_feature }
  subject { store }
  
  describe 'public API' do
    specify { subject.should respond_to(:enabled?) }
    specify { subject.should respond_to(:enable) }
    specify { subject.should respond_to(:disabled?) }
    specify { subject.should respond_to(:disable) }
    specify { subject.should respond_to(:features) }
    specify { subject.should respond_to(:conditionalize) }
  end
  
  before(:each) { subject.features.each{|f| subject.disable(f) } }
  
  describe '#enable' do
    it 'sets the feature to enabled' do
      subject.enable(:hello)
      subject.features.should =~ %w(hello)
    end
    
    context 'when enabling with hash params' do
      it 'conditionally enables the feature' do
        subject.enable(:hello, name: "jeff")
        subject.enable(:world, name: "jerry")
        subject.features.should =~ %w(hello world)
      end
    end
  end
  
  describe '#enabled?' do
    it 'stores a feature as enabled' do
      subject.enable(feature_name)
      subject.enabled?(feature_name).should be_true
      subject.disabled?(feature_name).should be_false
    end
    
    context 'when enabled with hash params' do
      it 'conditionally validates the feature' do
        subject.enable(:hello, name: "jeff")
        subject.source.get('dolphin:feature:hello').should eq "CONDITIONAL"
        subject.enabled?(:hello).should be_false
        subject.enabled?(:hello, name: "jeff").should be_true
      end
    end
  end
  
  describe '#disable' do
    it 'removes the feature from the store' do
      subject.disable(:hello)
      subject.features.should_not include("hello")
    end
  end
  
  describe '#disabled?' do
    it 'stores a feature as disabled' do
      subject.disable(feature_name)
      subject.disabled?(feature_name).should be_true
      subject.enabled?(feature_name).should be_false
    end
  
    context 'when the given feature does not exist' do
      it 'signifies a disabled feature' do
        subject.features.should_not include(feature_name)
        subject.disabled?(feature_name).should be_true
        subject.enabled?(feature_name).should be_false
      end
    end
  end
  
  describe '#features' do
    it 'provides a list of the potentially enabled features' do
      subject.enable(:hello)
      subject.enable(:world)
      subject.features.should =~ %w(hello world)
      subject.disable(:hello)
      subject.features.should =~ %w(world)
    end
  end
  
end