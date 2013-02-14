require 'spec_helper'

describe CooperativeApplication do

  let(:co_app) { FactoryGirl.build(:cooperative_application) }

  ['name', 'last_name', 'organization', 'phone', 'email', 'org_mission', 'org_website', 'org_twitter', 'reason', 'worked_on', 'part_meaningful', 'ins_failure', 'neighborhood', 'assisted_area', 'recommend'].each do |attr|
    it "should require #{attr}" do
      assert_presence co_app, attr.to_sym
    end
  end

  it 'should have valid email' do
    ['invalid_email', 'invalid_email@', 'invalid@email', 'invalid@email.'].each do |invalid_email|
      co_app.email = invalid_email
      assert_email co_app, :email
    end
  end

  it 'should have valid worked_on' do
    co_app.worked_on = 401
    should be_invalid
  end

  it 'should have valid part_meaningful' do
    co_app.part_meaningful = 201
    should be_invalid
  end

  it 'should have valid ins_failure' do
    co_app.worked_on = 301
    should be_invalid
  end

  it 'should have valid ins_failure' do
    co_app.worked_on = 101
    should be_invalid
  end

end
