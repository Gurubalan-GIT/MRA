# Meeting Room Application
This is a meeting room booking application which is done with `Ruby on rails` and `Bootstrap 4.4.` 
Hosted on Heroku - [MRA-Commutatus](https://mra-commutatus.herokuapp.com/).

## Introduction

This application has a rich user friendly UI and UX, authentication which is handled by `Devise` gem. 
The key features about this application are -

- Proper authentication, for users and admin accounts.
- The admins can delete any meetings and also a particular room which would further delete all the meetings in that room. 
- Admins can set the room capacity as well. 
- The meetings of the particular user are sorted datewise and also split into today's, upcoming ones and past meetings. 
- On further selecting the users / members for a particular meeting ( depending on room capacity set by the admin ) all the members get an invitation email sent to them through the `SMTP` server set up with rails on the server. 
- The multiple selection of users is handled by `Select2` which is a Jquery plugin. 
- A UI based calender which actually shows all the reccurring events for a particular user. 

## Instructions
To run the application you need to do a few things : 

- Run `rails server` followed by `rails db:migrate` ( or rake )
- Change your `development.rb` file credentials to match your account details. 
( The email which you want to send invites from. )
- If you're going to use it in production do the same changes in `production.rb` file as well. 
- [Development.rb](config/environments/development.rb) & [Production.rb](config/environments/production.rb)

## Schema Structure 

```
user.rb -
    has_many_and_belongs_to :meetings

meeting.rb -
    has_many_and_belongs_to :users 
    belongs_to :room

room.rb -
    has_many :meetings
    has_many :users, through: :meetings
```

Now the first question that might pop up is - Why not `user belongs to :room`? 
This is because prominently it doesn't make sense for a single user to belong to a room, 
logically a user would or should be able to belong to many rooms but we need the counterpart
which is mentioned in `room.rb` thus we leave the connection out entirely - 
- Thus to connect to the room of a particular user - We go through meetings because there'll
be a join table for users & meetings. ( has_many_and_belongs_to ) and then inturn from meetings 
to that room. 
- But the room can directly access it's users. Hence it is just not bi-directional, because logically 
we don't want it to be.

## Making right use of Helpers
Usually most people ignore the use of helpers in rails. Fill them up with functions which you always use. In your `Application_helper.erb` add functions such as parsing Time and date formats to be readable ones. Call these from your views so these get called on runtime. 
Make sure to add this to your controller for the view you're trying to call it -
`helper :application`

## Creating Admins
On localhost get into the console by -
- `rails console` and now assign a user you want to make it admin. An example active record query would be : 
- ```
  @user = User.where(email: "youremailinDB")
  @user.admin = true
  @user.save
  ```
- This will make that user an admin now. Refresh the page and it'll be redirected to the `rooms_path`
- For **Heroku** : SSH into the server or just run -
  `heroku run rails console`, this will run the console in the heroku remote server and execute the exact same steps above.

## Screenshots

<img src="/public/git-images/1.png" height="300"> 
<img src="/public/git-images/2.png" height="300"> 
<img src="/public/git-images/3.png" height="300"> 
<img src="/public/git-images/4.png" height="300">
<img src="/public/git-images/5.png" height="300"> 
<img src="/public/git-images/6.png" height="300"> 
<br>
How the mail get's sent to the members:
<img src="/public/git-images/7.png" height="300"> 

## Problems faced 
There were plenty which came along the process but I'll highlight the most important ones. 

- **Heroku deployment** : For this you need to do a couple of things because you are planning to run 
a SMTP server and pass credentials as well. 
- Create an application on Heroku and go over to settings and click on *reveal config vars*, 
and add a config : Value as - `RAILS_MASTER_KEY` and the key as the contents of your `master.key` 
lock file generated while creating your rails application.
- After that add this line in your `development.rb` and `production.rb` files - 
`config.require_master_key = true`.
- **Select2** : This might work fine in localhost:3000 but might have UI rendering issues on production 
servers like `Heroku`. For this simply go to your `application.css` and add `*= require select2` and your                     `application.js` and add `//= require select2`.
- **Webpacker** : Make sure you install some plugins through `yarn` or something which supports 
webpacker. ( The new assets pipeline from Rails 6.0 ).

## Useful links and references 

- [Official Documentation](https://guides.rubyonrails.org/getting_started.html)
- [Select2](https://medium.com/@psmy/rails-6-stimulus-and-select2-de4a4d2b59e4)
- [Action Mailers with SMTP](https://dev.to/morinoko/sending-emails-in-rails-with-action-mailer-and-gmail-35g4)
- [Chosen](https://harvesthq.github.io/chosen/)
- [Slim](http://slim-lang.com/)
- [Coffee Script](https://coffeescript.org/)
- [Devise Auth](https://github.com/heartcombo/devise)


_Thank you, for stopping by_          
 
