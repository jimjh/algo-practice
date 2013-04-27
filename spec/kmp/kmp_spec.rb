# ~*~ encoding: utf-8 ~*~
require 'spec_helper'
require File.expand_path('../../../kmp', __FILE__)

describe KMP do

  class DummyClass; include KMP; end
  subject { DummyClass.new }

  it 'matches' do
    subject.match('xxx', '123xxx456xxxx').should eq [3, 9, 10]
  end

end
