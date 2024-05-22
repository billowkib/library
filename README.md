# README

## Simple library application built with Rails 7


To run this application you need to have Ruby 3.2.2. In case you don't have Ruby installed here's a [tutorial](https://www.ruby-lang.org/en/documentation/installation/).

With Ruby installed run
```
gem install bundle
bundle install
```
And wait for the dependencies to finish installing.

Once the dependencies are installed. Run the following commands:

```
# Create local database
rails db:create
# Create testing data
rails db:seed
# Run the application server
bin/dev
```

At this point rails should be running on [localhost:3000](http://localhost:3000)

### Note

There's a bug with FactoryBot's config and my STIs factories (for the User model). So running `rspec` might throw some errors but running `rspec spec/models/file.rb` may show a passing test.
