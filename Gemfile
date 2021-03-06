source 'https://rubygems.org'
ruby '2.6.6'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'closure_tree'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use bootstrap-sass as css framework
gem 'bootstrap-sass'
# Use devise implement login function
gem 'devise'
# Use rails-i18n as rails translation
gem 'rails-i18n'
# Use devise-i18n as devise translation
gem "devise-i18n"
# Use select2-rails for beautifing f.select UI
gem "select2-rails"
# Use nested_form_fields automatically add event ticket form
gem "nested_form_fields"
# Use bootstrap-datepicker-rails for beautifing date form field UI
gem 'bootstrap-datepicker-rails'
# Use autosize-rails for autosizing form f.text_area
gem 'autosize-rails'
# Use implement text fiel WYSIWYG editor
gem 'ckeditor'
# Use ranked-model for row sorting, top, botton, up, down
gem 'ranked-model'
# Use jquery-ui-rails for event drag&drop
gem 'jquery-ui-rails'
# Use kaminari for implement pagination
gem 'kaminari'
# Use ransack for implement search function
gem 'ransack'
# Use carrierwave for file or image uploading
gem 'carrierwave'
# Use mini_magick for resizing image
gem 'mini_magick'
gem 'qiniu', '>= 6.9.0'
gem 'carrierwave-qiniu', '~> 1.1.5'
gem "figaro"

# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use rails-erd for analyse model's relations
  gem 'rails-erd'
  # Use awesome_rails_console for beautifing rails console
  gem 'awesome_rails_console'
  gem 'sqlite3'
end

group :development do
  # Use faker for generate fake data
  gem 'faker'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Please clean up duplicated gems if any.
# Feel free to remove gems that you don't want to use or if they conflict with other gem dependencies. (you might need to update .pryrc also)
group :development, :test do
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
end

group :production do
  gem 'pg', '~> 0.21'
end