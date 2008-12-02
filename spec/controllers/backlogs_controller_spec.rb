require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BacklogsController do

  def mock_backlog(stubs={})
    @mock_backlog ||= mock_model(Backlog, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all backlogs as @backlogs" do
      Backlog.should_receive(:find).with(:all).and_return([mock_backlog])
      get :index
      assigns[:backlogs].should == [mock_backlog]
    end

    describe "with mime type of xml" do
  
      it "should render all backlogs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Backlog.should_receive(:find).with(:all).and_return(backlogs = mock("Array of Backlogs"))
        backlogs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested backlog as @backlog" do
      Backlog.should_receive(:find).with("37").and_return(mock_backlog)
      get :show, :id => "37"
      assigns[:backlog].should equal(mock_backlog)
    end
    
    describe "with mime type of xml" do

      it "should render the requested backlog as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Backlog.should_receive(:find).with("37").and_return(mock_backlog)
        mock_backlog.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new backlog as @backlog" do
      Backlog.should_receive(:new).and_return(mock_backlog)
      get :new
      assigns[:backlog].should equal(mock_backlog)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested backlog as @backlog" do
      Backlog.should_receive(:find).with("37").and_return(mock_backlog)
      get :edit, :id => "37"
      assigns[:backlog].should equal(mock_backlog)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created backlog as @backlog" do
        Backlog.should_receive(:new).with({'these' => 'params'}).and_return(mock_backlog(:save => true))
        post :create, :backlog => {:these => 'params'}
        assigns(:backlog).should equal(mock_backlog)
      end

      it "should redirect to the created backlog" do
        Backlog.stub!(:new).and_return(mock_backlog(:save => true))
        post :create, :backlog => {}
        response.should redirect_to(backlog_url(mock_backlog))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved backlog as @backlog" do
        Backlog.stub!(:new).with({'these' => 'params'}).and_return(mock_backlog(:save => false))
        post :create, :backlog => {:these => 'params'}
        assigns(:backlog).should equal(mock_backlog)
      end

      it "should re-render the 'new' template" do
        Backlog.stub!(:new).and_return(mock_backlog(:save => false))
        post :create, :backlog => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested backlog" do
        Backlog.should_receive(:find).with("37").and_return(mock_backlog)
        mock_backlog.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :backlog => {:these => 'params'}
      end

      it "should expose the requested backlog as @backlog" do
        Backlog.stub!(:find).and_return(mock_backlog(:update_attributes => true))
        put :update, :id => "1"
        assigns(:backlog).should equal(mock_backlog)
      end

      it "should redirect to the backlog" do
        Backlog.stub!(:find).and_return(mock_backlog(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(backlog_url(mock_backlog))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested backlog" do
        Backlog.should_receive(:find).with("37").and_return(mock_backlog)
        mock_backlog.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :backlog => {:these => 'params'}
      end

      it "should expose the backlog as @backlog" do
        Backlog.stub!(:find).and_return(mock_backlog(:update_attributes => false))
        put :update, :id => "1"
        assigns(:backlog).should equal(mock_backlog)
      end

      it "should re-render the 'edit' template" do
        Backlog.stub!(:find).and_return(mock_backlog(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested backlog" do
      Backlog.should_receive(:find).with("37").and_return(mock_backlog)
      mock_backlog.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the backlogs list" do
      Backlog.stub!(:find).and_return(mock_backlog(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(backlogs_url)
    end

  end

end
