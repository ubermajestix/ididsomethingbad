require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/backlogs/new.html.erb" do
  include BacklogsHelper
  
  before(:each) do
    assigns[:backlog] = stub_model(Backlog,
      :new_record? => true,
      :feature => "value for feature",
      :title => "value for title"
    )
  end

  it "should render new form" do
    render "/backlogs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", backlogs_path) do
      with_tag("textarea#backlog_feature[name=?]", "backlog[feature]")
      with_tag("input#backlog_title[name=?]", "backlog[title]")
    end
  end
end


