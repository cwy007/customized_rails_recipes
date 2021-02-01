# 活动报名系统

用户可以在前台看到活动信息，可以在前台进行报名。管理员可以在后台管理活动资料，用户资料和报名资料

* 技术议题
  * 自定义Model网址
  * 多语言设置
  * 时区设置，格式化日期时间
  * 表单单选 UI (固定选项无 Model )，表单单选 UI 和 Select2 Plugin，表单多选 UI 和 Select2 Plugin
  * 避免 N+1 SQL 查询
  * 嵌套表单（1-to-1），嵌套表单 (1-to-many)
  * 选日期时间的 UI
  * 拆开前后台的 CSS 和 JS，Rich Editor 编辑器
  * 批量编辑（Bulk Editing)，批量删除（Bulk Deleting），自订列表顺序（ranked-model）
  * 多步骤表单，有条件的表单验证（Conditional Validations ）
  * 资料筛选和搜索（ransack）
  * 七牛云图片上传

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
