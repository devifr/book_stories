# README

** This application purpose for code test **
** created by Devi Firdaus Fauzi **

* All Version
Rails version             6.0.5
Ruby version              ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-darwin21]
RubyGems version          3.2.3
Rack version              2.2.4

* Step To use this Application
** 1. Clone this application
> git clone https://github.com/devifr/book_stories.git
** 2. Go to application folder
> cd book_stories
** 3. Bundle install
> bundle install
** 4. Add database.yml on config path or rename database.yml.example to database.yml
> touch config/database.yml 
or 
> mv config/database.yml.example database.yml
** 5. Set config/database.yml with you authenticate of your postgres credential
** 6. Run create db
> rails db:create
** 7. Run migration table
> rails db:migrate
** 8. Run db seed
> rails db:seed
** 9. Start server of rails
> rails s
** 10. You can run rspec test
> bundle exec rspec spec/**/*
