module SessionsHelper
  require "googleauth"

  def log_in_user
    session[:user_id] = rand(10...42)

    session[:credentials] = Google::Auth::UserRefreshCredentials.new(
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET'],
      scope: [
        "https://www.googleapis.com/auth/drive",
        "https://spreadsheets.google.com/feeds/",
      ],
      redirect_uri: "http://localhost:3000/redirect")
    session[:auth_url] = session[:credentials].authorization_uri.to_s
  end

  def current_user
    if @current_user
      p "CONSERVA"
      @current_user
    else
      p "NUEVO"
      @current_user = User.new
    end
    @current_user
  end


  def logged_in?
    !current_user.nil?
  end


end
