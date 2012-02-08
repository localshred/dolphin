require 'spec_helper'

describe Dolphin::Store::Base do
  
  describe 'public API' do
    subject { described_class.new(Hash.new) }
    specify { subject.should respond_to(:enabled?) }
    specify { subject.should respond_to(:disabled?) }
    specify { subject.should respond_to(:enable) }
    specify { subject.should respond_to(:disable) }
    specify { subject.should respond_to(:features) }
    specify { subject.should respond_to(:conditionalize) }
    specify { expect { subject.enabled?(:blah) }.to raise_error(/not implemented/i) }
    specify { expect { subject.disabled?(:blah) }.to raise_error(/not implemented/i) }
    specify { expect { subject.enable(:blah) }.to raise_error(/not implemented/i) }
    specify { expect { subject.disable(:blah) }.to raise_error(/not implemented/i) }
    specify { expect { subject.features }.to raise_error(/not implemented/i) }
    specify { expect { subject.conditionalize(:blah) }.to raise_error(/not implemented/i) }
  end
  
end