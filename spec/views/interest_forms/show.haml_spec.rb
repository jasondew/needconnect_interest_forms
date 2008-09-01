require File.dirname(__FILE__) + '/../../spec_helper'

describe "/InterestForms/show.haml" do
  include InterestFormsHelper
  
  before do
    @interest_form = mock_model(Interest_form)

    assigns[:interest_form] = @interest_form
  end

  it "should render attributes in <p>" do
    render "/InterestForms/show.haml"
  end
end

