class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  helper :all
  protect_from_forgery # :secret => '62f69d7bb3dc76df50b7d1007f05be29'
  filter_parameter_logging :password
end
