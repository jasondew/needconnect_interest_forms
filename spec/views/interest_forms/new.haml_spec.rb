require File.dirname(__FILE__) + '/../../spec_helper'

describe "/InterestForms/new.haml" do
  include InterestFormsHelper
  
  before do
    @interest_form = mock_model(Interest_form)
    @interest_form.stub!(:new_record?).and_return(true)
    assigns[:interest_form] = @interest_form
  end

  it "should render new form" do
    render "/InterestForms/new.haml"
    
    response.should have_tag("form[action=?][method=post]", interest_forms_path) do
    end
  end
end
