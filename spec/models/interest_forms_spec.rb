require File.dirname(__FILE__) + '/../spec_helper'

describe Interest_form do
  before(:each) do
    @interest_form = Interest_form.new
  end

  it "should be valid" do
    @interest_form.should be_valid
  end
end
