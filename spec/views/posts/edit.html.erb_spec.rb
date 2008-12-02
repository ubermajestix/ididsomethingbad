require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/edit.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :new_record? => false,
      :body => "value for body",
      :anon => false
    )
  end

  it "should render edit form" do
    render "/posts/edit.html.erb"
    
    response.should have_tag("form[action=#{post_path(@post)}][method=post]") do
      with_tag('input#post_body[name=?]', "post[body]")
      with_tag('input#post_anon[name=?]', "post[anon]")
    end
  end
end


