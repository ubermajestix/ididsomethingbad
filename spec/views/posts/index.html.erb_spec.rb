require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/index.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:posts] = [
      stub_model(Post,
        :body => "value for body",
        :anon => false
      ),
      stub_model(Post,
        :body => "value for body",
        :anon => false
      )
    ]
  end

  it "should render list of posts" do
    render "/posts/index.html.erb"
    response.should have_tag("tr>td", "value for body", 2)
    response.should have_tag("tr>td", false, 2)
  end
end

