# IPA

It is the source repository of the website of Information & Photography Association (IPA) built on Ruby on Rails.

The website is still in development. Issues and pull requests are welcome.

## How to deploy

The code here includes no configuration for production.

Following configurations are needed.

```bash
$ bundle install
$ rake secret >> .env
$ rake assets:precompile
```
