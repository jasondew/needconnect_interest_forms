ActionController::Routing::Routes.draw do |map|

  map.resources :interest_forms
  map.resource :session

  map.namespace :admin do |admin|
    admin.resource :report
  end

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'

  map.root :controller => 'interest_forms', :action => 'new'

end
