require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/backlogs/show.html.erb" do
  include BacklogsHelper
  
  before(:each) do
    assigns[:backlog] = @backlog = stub_model(Backlog,
      :feature => "value for feature",
      :title => "value for title"
    )
  end

  it "should render attributes in <p>" do
    render "/backlogs/show.html.erb"
    response.should have_text(/value\ for\ feature/)
    response.should have_text(/value\ for\ title/)
  end
end

