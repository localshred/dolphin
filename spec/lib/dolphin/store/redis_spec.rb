require 'spec_helper'

describe Dolphin::Store::Redis do
  
  describe 'public API' do
    specify { subject.should respond_to(:enabled?) }
    specify { subject.should respond_to(:disabled?) }
  end
  
end