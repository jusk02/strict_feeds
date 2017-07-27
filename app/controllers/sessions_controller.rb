class SessionsController < ApplicationController

  def new

  end

  def create
      log_in_user
      redirect_to session[:auth_url]
  end

  


end
