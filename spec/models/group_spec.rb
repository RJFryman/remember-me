require 'spec_helper'

describe Group do
  it { should validate_uniqueness_of :name }

  describe 'name' do
    it { should allow_value('testgroup').for(:name) }
    it { should allow_value('test group').for(:name) }
    it { should allow_value('test group 1').for(:name) }
    it { should allow_value('test group !@#$').for(:name) }
    it { should_not allow_value('12345').for(:name) }
    it { should_not allow_value('!@#$%').for(:name) }
  end
end
