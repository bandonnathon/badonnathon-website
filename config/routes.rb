ChaplinExample::Application.routes.draw do
  
  root :to => 'app#show'
  match 'addsong' => 'app#show'
  match 'thanks' => 'app#show'
  match 'listen' => 'app#show'
  match 'marathonmix' => 'app#show'
  match 'about' => 'app#show'
  
  match 'playlist' => 'playlist#index', :via => :get
  match 'playlist' => 'playlist#add', :via => :post

  match 'search' => 'app#search', :via => :get
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
