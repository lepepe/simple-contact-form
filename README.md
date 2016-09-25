# Simple contact form for static pages.

### Requiered:   
1. Clone this repository `$ git clone git@github.com:lepepe/simple-contact-form.git`.   
2. Create a [Heroku](http://heroku.com) account.   
3. Install the heroku command line interface [Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line).   
4. Integrate [Sendgrid add-on](https://elements.heroku.com/addons/sendgrid) to your account.   

### Update the cloned repo:   
`$ cd simple-contact-form`   
`$ vim application.rb`      

```
set :mail_options, {
  # your email account
	:to => 'YOUR@EMAIL.COM',
	:from => 'YOUR@EMAIL.COM',
	:via => :smtp,
	:via_options => {
		:address => 'smtp.sendgrid.net',
		:port => 587,
		:domain => 'heroku.com',
    # this env variables will be set automatically when add sendgrid add-on to your heroku account.
		:user_name => ENV['SENDGRID_USERNAME'],
		:password => ENV['SENDGRID_PASSWORD'],
		:authentication => :plain
	}
}
```   

### Jekyll contact form:   

```
<form action="https://YOUR_HEROKU_APP_NAME.herokuapp.com/send_email" class="m-b-sm-70" method="POST">
	<div class="form-group">
		<label>Name</label>
		<input type="text" name="name" class="form-control" placeholder="Name" required>
	</div>
	<div class="form-group">
		<label>Your Email</label>
		<input type="email" name="email" class="form-control" placeholder="Your E-mail" required>
	</div>
	<div class="form-group">
		<label>Subject</label>
		<input type="text" name="subject" class="form-control" placeholder="Subject" required>
	</div>
	<div class="form-group">
		<textarea class="form-control" name="message" rows="7" placeholder="Message" required></textarea>
	</div>
	<div class="text-center">
		<input type="submit" value="Submit" class="btn btn-primary">
	</div>
</form>
```

### Initialize git to deploy to your heroku account:   

```
$ git init
$ heroku git:remote -a YOUR_APP_NAME

# Deploy
$ git add .
$ git commit -am "make it better"
$ git push heroku master
```   

### Check if your app is working:   
```
$ heroku open --app YOUR_APP_NAME
```   

You should see in your browser:      
![Working](https://raw.githubusercontent.com/lepepe/simple-contact-form/master/working.png)
