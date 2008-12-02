require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/new.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:post] = stub_model(Post,
      :new_record? => true,
      :body => "value for body",
      :anon => false
    )
  end

  it "should render new form" do
    render "/posts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", posts_path) do
      with_tag("input#post_body[name=?]", "post[body]")
      with_tag("input#post_anon[name=?]", "post[anon]")
    end
  end
end


