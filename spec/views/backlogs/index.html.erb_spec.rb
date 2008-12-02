require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/backlogs/index.html.erb" do
  include BacklogsHelper
  
  before(:each) do
    assigns[:backlogs] = [
      stub_model(Backlog,
        :feature => "value for feature",
        :title => "value for title"
      ),
      stub_model(Backlog,
        :feature => "value for feature",
        :title => "value for title"
      )
    ]
  end

  it "should render list of backlogs" do
    render "/backlogs/index.html.erb"
    response.should have_tag("tr>td", "value for feature", 2)
    response.should have_tag("tr>td", "value for title", 2)
  end
end

