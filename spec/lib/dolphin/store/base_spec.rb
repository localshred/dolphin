require 'spec_helper'

describe Dolphin::Store::Base do
  
  describe 'public API' do
    specify { subject.should respond_to(:enabled?) }
    specify { expect { subject.enabled?(:blah) }.to raise_error(/not implemented/i) }
    specify { subject.should respond_to(:disabled?) }
    specify { expect { subject.disabled?(:blah) }.to raise_error(/not implemented/i) }
  end
  
end