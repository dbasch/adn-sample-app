## Sample application for App.net

This is an application built with Sinatra and omniauth-appdotnet. It shows some basic stats from your profile,
but it's really meant as a starting point to create something more useful.

For your local tests, run:

id=[your client id] secret=[your client secret] ruby app.rb

Find me at https://alpha.app.net/dbasch

## Hosting it on Heroku

Create your app at https://alpha.app.net/developer/apps/

heroku create [appname]

For the callback url, use http://[appname].herokuapp.com/auth/appdotnet/callback

heroku config:add id=[your client id] secret=[your client secret]

git push heroku master
