require File.dirname(__FILE__) + '/../../spec_helper'

describe "/InterestForm/edit.haml" do
  include InterestFormsHelper
  
  before do
    @interest_form = mock_model(Interest_form)
    assigns[:interest_form] = @interest_form
  end

  it "should render edit form" do
    render "/InterestForms/edit.haml"
    
    response.should have_tag("form[action=#{interest_form_path(@interest_form)}][method=post]") do
    end
  end
end