# customized_rails_recipes

## setup

```shell
git clone https://github.com/cwy007/customized_rails_recipes.git
cd customized_rails_recipes
cp config/application.yml.default config/application.yml
bundle check
bundle install
rails s
```

<http://localhost:3000>

## 部署到 heroku

[注册heroku账号](https://signup.heroku.com/)

>`chanweiyan001@gmail.com`

```bash
heroku login -i
heroku create
figaro heroku:set -e production
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
heroku open

heroku logs --tail
```

## heroku 支持的 ruby 版本

```bash
2.6.6, Rubygems: 3.0.3
2.7.2, Rubygems: 3.1.4
3.0.0, Rubygems: 3.2.3

# https://devcenter.heroku.com/articles/ruby-support#supported-runtimes
```

## rails about

```bash
➜  customized_rails_recipes git:(master) ✗ rails about
About your application's environment
Rails version             5.0.2
Ruby version              2.6.6-p146 (x86_64-darwin20)
RubyGems version          3.0.9
Rack version              2.0.1
JavaScript Runtime        Node.js (V8)
Middleware                Rack::Sendfile, ActionDispatch::Static, ActionDispatch::Executor, ActiveSupport::Cache::Strategy::LocalCache::Middleware, Rack::Runtime, Rack::MethodOverride, ActionDispatch::RequestId, Sprockets::Rails::QuietAssets, Rails::Rack::Logger, ActionDispatch::ShowExceptions, WebConsole::Middleware, ActionDispatch::DebugExceptions, ActionDispatch::RemoteIp, ActionDispatch::Reloader, ActionDispatch::Callbacks, ActiveRecord::Migration::CheckPending, ActionDispatch::Cookies, ActionDispatch::Session::CookieStore, ActionDispatch::Flash, Rack::Head, Rack::ConditionalGet, Rack::ETag, Warden::Manager
Application root          /Users/chanweiyan/beijing/customized_rails_recipes
Environment               development
Database adapter          sqlite3
Database schema version   0
```

## 参考

* [figaro](https://github.com/laserlemon/figaro)
  >figaro heroku:set -e production
