require File.dirname(__FILE__) + '/../../spec_helper'

describe "/InterestForms/index.haml" do
  include InterestFormsHelper
  
  before do
    interest_form_98 = mock_model(Interest_form)
    interest_form_99 = mock_model(Interest_form)

    assigns[:interest_forms] = [interest_form_98, interest_form_99]
  end

  it "should render list of interest_forms" do
    render "/InterestForms/index.haml"
  end
end
