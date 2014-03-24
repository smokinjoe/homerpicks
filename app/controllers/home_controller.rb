class HomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    @signed_in = !current_user.equal?(nil)
    @predictions = Prediction.all
    @season_started = true
    render 'index'
  end
end
