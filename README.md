# IPA

It is the source repository of the website of Information & Photography Association (IPA).

The website is still in development. Issues and pull requests are welcome.

## About deploying

The code here includes no configuration for production.

If you've just cloned the repository, you need to run:

```bash
$ bundle install
$ (echo -e "SECRET_KEY_BASE=\c" && rake secret) >> .env
```bash

You have to add some secrets to the **`.env`** file.

**Qiniu keys and database information are needed, format:**

```
QINIU_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
QINIU_SECRET_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
DATABASE_USERNAME=YOURUSERNAME
DATABASE_PASSWORD=YOURPASSWORD
```

Now you can finish initializing the databse:

```
$ rake db:create RAILS_ENV=production
$ rake db:migrate RAILS_ENV=production
$ rake assets:precompile RAILS_ENV=production
```

Or you just want to update, run:

```bash
$ git pull
$ bundle install
$ rake db:migrate RAILS_ENV=production
$ rake assets:precompile RAILS_ENV=production
```

And then restart your server.