require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Backlog do
  before(:each) do
    @valid_attributes = {
      :user_id => "1",
      :feature => "value for feature",
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    Backlog.create!(@valid_attributes)
  end
end
