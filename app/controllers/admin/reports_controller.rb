class Admin::ReportsController < ApplicationController

  before_filter :login_required

  def show
    @interest_forms = InterestForm.all
  end

end
