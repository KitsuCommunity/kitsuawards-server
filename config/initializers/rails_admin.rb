RailsAdmin.config do |config|
  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.asset_source = :sprockets

  config.authenticate_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      user = User.where(name: username).first

      user.authenticate(password) if user
    end
  end
end
