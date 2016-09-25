require 'sinatra'
require 'rack/cors'
require 'pony'
 
use Rack::Cors do |config|
  config.allow do |allow|
    allow.origins '*'
    allow.resource '/send_email', :methods => [:post]
  end
end

set :mail_options, {
	:to => 'YOUR@EMAIL.COM',
	:from => 'YOUR@EMAIL.COM',
	:via => :smtp,
	:via_options => {
		:address => 'smtp.sendgrid.net',
		:port => 587,
		:domain => 'heroku.com',
		:user_name => ENV['SENDGRID_USERNAME'],
		:password => ENV['SENDGRID_PASSWORD'],
		:authentication => :plain
	}
}

get '/' do
	"<h1 style='color: #186A3B'>WORKING...!!!</h1>"
end

post '/send_email' do
  senders_name = params[:name]
  senders_email = params[:email]
  message = params[:message]
  subject = params[:subject]
  body = "#{senders_name}, #{senders_email}\n\n#{subject}\n\n#{message}"

  settings.mail_options[:body] = body
  settings.mail_options[:subject] = "New message via contact form"

  Pony.mail(settings.mail_options)
  redirect "http://YOUR_THANK_YOU_URL"
end
