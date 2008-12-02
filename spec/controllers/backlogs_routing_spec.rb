require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BacklogsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "backlogs", :action => "index").should == "/backlogs"
    end
  
    it "should map #new" do
      route_for(:controller => "backlogs", :action => "new").should == "/backlogs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "backlogs", :action => "show", :id => 1).should == "/backlogs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "backlogs", :action => "edit", :id => 1).should == "/backlogs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "backlogs", :action => "update", :id => 1).should == "/backlogs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "backlogs", :action => "destroy", :id => 1).should == "/backlogs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/backlogs").should == {:controller => "backlogs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/backlogs/new").should == {:controller => "backlogs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/backlogs").should == {:controller => "backlogs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/backlogs/1").should == {:controller => "backlogs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/backlogs/1/edit").should == {:controller => "backlogs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/backlogs/1").should == {:controller => "backlogs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/backlogs/1").should == {:controller => "backlogs", :action => "destroy", :id => "1"}
    end
  end
end
