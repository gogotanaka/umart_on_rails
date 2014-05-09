source "https://rubygems.org"

gem "rails", '4.1.1'

source 'https://rails-assets.org'

ruby '2.1.1'

# Bower Manager => https://rails-assets.org/

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'uglifier'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# turbolinks support
gem 'jquery-turbolinks'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# CSS Support
gem 'less-rails'

# Use unicorn as the app server
gem 'unicorn'

# Presenter Layer
#gem 'draper'

# Haml
gem 'haml-rails'

# asset取得系のログを出力しない
gem 'quiet_assets'

# Form Builders
gem 'simple_form'

# 定数管理
#gem 'rails_config'

# プロセス管理
gem 'foreman'

# params 引数化
gem 'action_args'

# HTML5バリデーター
gem 'html5_validators'

# PG/MySQL Log Formatter
gem 'rails-flog'

# Migration Helper
gem 'migrant'

# Pagenation
gem 'kaminari'


gem 'pg'
# NewRelic
#gem 'newrelic_rpm'

group :development do
  # erbからhamlに変換
  gem 'erb2haml'
end

group :development, :test do
  # Rails application preloader
  gem 'spring'

  # Railsコンソールの多機能版
  gem 'pry-rails'

  # pryの入力に色付け
  gem 'pry-coolline'

  # デバッカー
  gem 'pry-byebug'

  # Pryでの便利コマンド
  gem 'pry-doc'

  # PryでのSQLの結果を綺麗に表示
  gem 'hirb'
  gem 'hirb-unicode'

  # pryの色付けをしてくれる
  gem 'awesome_print'
end

group :test do
  # Rspec
  gem 'rspec-rails'

  # fixtureの代わり
  gem "factory_girl_rails"

  # テスト環境のテーブルをきれいにする
  gem 'database_rewinder'
end

group :production, :staging do
  # ログ保存先変更、静的アセット Heroku 向けに調整
  gem 'rails_12factor'
end
