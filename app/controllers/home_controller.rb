class HomeController < ApplicationController



  def index
    if @@current_user.google
      p "si hay"
      @current_user = @@current_user
    end
  end

  def redirect

    credentials = Google::Auth::UserRefreshCredentials.new(
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET'],
      scope: [
        "https://www.googleapis.com/auth/drive",
        "https://spreadsheets.google.com/feeds/",
      ],
      redirect_uri: "http://localhost:3000/redirect")
    auth_url = session[:auth_url]
    @authorization_code = params[:code]
    credentials.code = @authorization_code
    credentials.fetch_access_token!

    @@current_user.google = GoogleDrive::Session.from_credentials(credentials)

    p current_user
    p "555555"

  end



end
