require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/backlogs/edit.html.erb" do
  include BacklogsHelper
  
  before(:each) do
    assigns[:backlog] = @backlog = stub_model(Backlog,
      :new_record? => false,
      :feature => "value for feature",
      :title => "value for title"
    )
  end

  it "should render edit form" do
    render "/backlogs/edit.html.erb"
    
    response.should have_tag("form[action=#{backlog_path(@backlog)}][method=post]") do
      with_tag('textarea#backlog_feature[name=?]', "backlog[feature]")
      with_tag('input#backlog_title[name=?]', "backlog[title]")
    end
  end
end


