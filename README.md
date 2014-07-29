# IPA

It is the source repository of the website of Information & Photography Association (IPA).

The website is still in development. Issues and pull requests are welcome.

## About deploying

The code here includes no configuration for production.

If you've just cloned the repository, you need to run:

```bash
$ bundle install
$ (echo "SECRET_KEY_BASE: \c" & rake secret) >> .env
$ rake assets:precompile
```

Or you just want to update, run:

```bash
$ git pull
$ bundle install
$ rake assets:precompile
```

And then restart your server.