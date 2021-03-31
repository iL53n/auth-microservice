class AuthRoutes < Application
  get '/' do
    json auth: []
  end
end
