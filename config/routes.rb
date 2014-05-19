Rails.application.routes.draw do

  #Set Route for recents tweets function of the TwitterController 
  get 'twitter/tweets'
  #Set Route for common friends function of the TwitterController   
  get 'twitter/common_friends'

  #Map root url to the index function of the TwitterController
  get '/' => 'twitter#index', :as => 'index'
end
