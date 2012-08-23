%w(omniauth omniauth-appdotnet sinatra open-uri json haml time).each { |dependency| require dependency }

enable :sessions
use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :appdotnet, ENV['id'], ENV['secret']
end

get '/' do
  token = session['token']
  unless token.nil?
    toOpen = "https://alpha-api.app.net/stream/0/users/me"
    @user = JSON.load open(toOpen, "Authorization" => "Bearer " + token)
    posts = @user['counts']['posts']
    @avg = "%.2f" % (posts / ((Time.now - Time.parse(@user['created_at'])) / 86400))
    haml :show
  else
    haml :index
  end
end

get '/auth/appdotnet/callback' do
  auth = request.env['omniauth.auth']
  token = auth['credentials']['token']
  session['token'] = token
  redirect '/'
end
