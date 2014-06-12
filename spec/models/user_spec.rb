require 'spec_helper'

describe User do
  it { should validate_uniqueness_of :username }
  it { should validate_uniqueness_of :email }

  describe 'username' do
    it { should allow_value('robert').for(:username) }
    it { should_not allow_value('rob ert').for(:username) }
    it { should_not allow_value('robert?').for(:username) }
    it { should_not allow_value('#!@#$%^').for(:username) }
    it { should_not allow_value('@robert').for(:username) }
  end
end
