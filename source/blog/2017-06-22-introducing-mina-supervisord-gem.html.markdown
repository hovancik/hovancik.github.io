---
title: Introducing mina-supervisord gem
date: 2017-06-22 09:18 UTC
tags: ruby, gem, mina, supervisord, mina-supervisord
---

Hi there,  

I'm happy to announce the first release of gem [mina-supervisord](https://github.com/hovancik/mina-supervisord).

Mina::Supervisord is a [Supervisor](http://supervisord.org/) (process control system) wrapper for [mina](https://github.com/mina-deploy/mina).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-supervisord', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-supervisord

## Usage

To restart your app during deploy you might add this to `deloy.rb`:

```ruby
require 'mina/supervisord'

task deploy: :environment do
  deploy do
    ...
    on :launch do
      invoke :'supervisord:restart', 'puma'
    end
  end
end
```
To call it as mina task, eg. to start your puma, you would run this from command line:

```ruby
bundle exec mina supervisord:start['puma']

```

`puma` is a supervisord [program](http://supervisord.org/running.html#adding-a-program).

### Supported tasks
- `supervisord:restart`- to restart a program (eg. `bundle exec mina supervisord:restart['program']`)
- `supervisord:start`- to start a program (eg. `bundle exec mina supervisord:start['program']`)
- `supervisord:stop`- to stop a program (eg. `bundle exec mina supervisord:stop['program']`)
- `supervisord:status`- to get status of a program (eg. `bundle exec mina supervisord:status['program']`)
- `supervisord:signal`- to send a signal to a program (eg. `bundle exec mina supervisord:signal['program,signal']`)
#### Extra tasks
- `supervisord:signal:or_start`- to send a signal to a program, or start it if not running (eg. `bundle exec mina supervisord:signal:or_start['program,signal']`)
- `supervisord:restart:or_start`- to restart a program, or start it if not running (eg. `bundle exec mina supervisord:restart:or_start['program']`)

You might find these extra tasks useful when you are not sure whether your program is running.

Eg. when we do our deploy, we want our `puma` server to be restarted or started if not running already. To do that, we have following in our `deploy.rb`:

```ruby
desc "Phased restart of the application"
task :phased_restart => :environment do
  invoke :'supervisord:signal:or_start', fetch(:application_supervisor_file), "SIGUSR1"
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hovancik/mina-supervisord. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Development of this gem is sponsored by [Mix.it](http://mix.it).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
