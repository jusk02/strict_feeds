class ApplicationController < ActionController::Base
  require "googleauth"

  include SessionsHelper
  protect_from_forgery with: :exception

  @@current_user = User.new







end
