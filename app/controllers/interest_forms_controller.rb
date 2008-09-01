class InterestFormsController < ApplicationController
  def new
    @interest_form = InterestForm.new
  end

  def create
    @interest_form = InterestForm.new :email      => params[:interest_form][:email],
                                      :ip         => request.headers['REMOTE_ADDR'],
                                      :user_agent => request.headers['HTTP_USER_AGENT']

    if @interest_form.save
      flash[:notice] = 'Thank you for your interest in the NeedConnect project.  We will notify you as soon as the site is ready.'
      redirect_to root_path
    else
      render :action => "new"
    end
  end

end
