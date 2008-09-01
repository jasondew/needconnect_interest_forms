require File.dirname(__FILE__) + '/../spec_helper'

describe InterestFormsController, "#route_for" do

  it "should map { :controller => 'InterestForms', :action => 'index' } to /InterestForms" do
    route_for(:controller => "InterestForms", :action => "index").should == "/InterestForms"
  end
  
  it "should map { :controller => 'InterestForms', :action => 'new' } to /InterestForms/new" do
    route_for(:controller => "InterestForms", :action => "new").should == "/InterestForms/new"
  end
  
  it "should map { :controller => 'InterestForms', :action => 'show', :id => 1 } to /InterestForms/1" do
    route_for(:controller => "InterestForms", :action => "show", :id => 1).should == "/InterestForms/1"
  end
  
  it "should map { :controller => 'InterestForms', :action => 'edit', :id => 1 } to /InterestForms/1/edit" do
    route_for(:controller => "InterestForms", :action => "edit", :id => 1).should == "/InterestForms/1/edit"
  end
  
  it "should map { :controller => 'InterestForms', :action => 'update', :id => 1} to /InterestForms/1" do
    route_for(:controller => "InterestForms", :action => "update", :id => 1).should == "/InterestForms/1"
  end
  
  it "should map { :controller => 'InterestForms', :action => 'destroy', :id => 1} to /InterestForms/1" do
    route_for(:controller => "InterestForms", :action => "destroy", :id => 1).should == "/InterestForms/1"
  end
  
end

describe InterestFormsController, "handling GET /InterestForms" do

  before do
    @interest_form = mock_model(Interest_form)
    Interest_form.stub!(:find).and_return([@interest_form])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all InterestForms" do
    Interest_form.should_receive(:find).with(:all).and_return([@interest_form])
    do_get
  end
  
  it "should assign the found InterestForms for the view" do
    do_get
    assigns[:interest_forms].should == [@interest_form]
  end
end

describe InterestFormsController, "handling GET /InterestForms.xml" do

  before do
    @interest_form = mock_model(Interest_form, :to_xml => "XML")
    Interest_form.stub!(:find).and_return(@interest_form)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all InterestForms" do
    Interest_form.should_receive(:find).with(:all).and_return([@interest_form])
    do_get
  end
  
  it "should render the found InterestForm as xml" do
    @interest_form.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe InterestFormsController, "handling GET /InterestForms/1" do

  before do
    @interest_form = mock_model(Interest_form)
    Interest_form.stub!(:find).and_return(@interest_form)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the interest_form requested" do
    Interest_form.should_receive(:find).with("1").and_return(@interest_form)
    do_get
  end
  
  it "should assign the found interest_form for the view" do
    do_get
    assigns[:interest_form].should equal(@interest_form)
  end
end

describe InterestFormsController, "handling GET /InterestForms/1.xml" do

  before do
    @interest_form = mock_model(Interest_form, :to_xml => "XML")
    Interest_form.stub!(:find).and_return(@interest_form)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the interest_form requested" do
    Interest_form.should_receive(:find).with("1").and_return(@interest_form)
    do_get
  end
  
  it "should render the found interest_form as xml" do
    @interest_form.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe InterestFormsController, "handling GET /InterestForms/new" do

  before do
    @interest_form = mock_model(Interest_form)
    Interest_form.stub!(:new).and_return(@interest_form)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new interest_form" do
    Interest_form.should_receive(:new).and_return(@interest_form)
    do_get
  end
  
  it "should not save the new interest_form" do
    @interest_form.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new interest_form for the view" do
    do_get
    assigns[:interest_form].should equal(@interest_form)
  end
end

describe InterestFormsController, "handling GET /InterestForms/1/edit" do

  before do
    @interest_form = mock_model(Interest_form)
    Interest_form.stub!(:find).and_return(@interest_form)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the interest_form requested" do
    Interest_form.should_receive(:find).and_return(@interest_form)
    do_get
  end
  
  it "should assign the found interest_form for the view" do
    do_get
    assigns[:interest_form].should equal(@interest_form)
  end
end

describe InterestFormsController, "handling POST /InterestForms" do

  before do
    @interest_form = mock_model(Interest_form, :to_param => "1")
    Interest_form.stub!(:new).and_return(@interest_form)
  end
  
  def post_with_successful_save
    @interest_form.should_receive(:save).and_return(true)
    post :create, :interest_form => {}
  end
  
  def post_with_failed_save
    @interest_form.should_receive(:save).and_return(false)
    post :create, :interest_form => {}
  end
  
  it "should create a new interest_form" do
    Interest_form.should_receive(:new).with({}).and_return(@interest_form)
    post_with_successful_save
  end

  it "should redirect to the new interest_form on successful save" do
    post_with_successful_save
    response.should redirect_to(interest_form_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe InterestFormsController, "handling PUT /InterestForms/1" do

  before do
    @interest_form = mock_model(Interest_form, :to_param => "1")
    Interest_form.stub!(:find).and_return(@interest_form)
  end
  
  def put_with_successful_update
    @interest_form.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @interest_form.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the interest_form requested" do
    Interest_form.should_receive(:find).with("1").and_return(@interest_form)
    put_with_successful_update
  end

  it "should update the found interest_form" do
    put_with_successful_update
    assigns(:interest_form).should equal(@interest_form)
  end

  it "should assign the found interest_form for the view" do
    put_with_successful_update
    assigns(:interest_form).should equal(@interest_form)
  end

  it "should redirect to the interest_form on successful update" do
    put_with_successful_update
    response.should redirect_to(interest_form_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe InterestFormsController, "handling DELETE /InterestForm/1" do

  before do
    @interest_form = mock_model(Interest_form, :destroy => true)
    Interest_form.stub!(:find).and_return(@interest_form)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the interest_form requested" do
    Interest_form.should_receive(:find).with("1").and_return(@interest_form)
    do_delete
  end
  
  it "should call destroy on the found interest_form" do
    @interest_form.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the InterestForms list" do
    do_delete
    response.should redirect_to(interest_forms_url)
  end
end
