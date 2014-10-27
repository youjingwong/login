enable :sessions

def login?
  if session[:username].nil?
    return false
  else
    return true
  end
end

def username
  return session[:username]
end

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get "/signup" do
  erb :signup
end

post "/signup" do
  User.create(username: params[:username], email: params[:email],password: params[:password])

  session[:username] = params[:username]
  redirect "/"
end

post "/login" do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:username] = @user[:username]
    redirect "/"
  end
  erb :error
end

get "/logout" do
  session[:username] = nil
  redirect "/"
end


