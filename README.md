##### Prerequisites

The setups steps expect following tools installed on the system.

- Ruby [2.5.1](https://github.com/GianGuzmanOki/pickem/blob/master/Gemfile#L4)
- Rails [6.1.4](https://github.com/GianGuzmanOki/pickem/blob/master/Gemfile#L7)

- Redis
##### 1. Check out the repository

```bash
git clone https://github.com/GianGuzmanOki/pickem.git
```
##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Install all the gems


```bash
bundle install
```


##### 4. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
```
Run the seed to create a default admin if you are on a development environment
```ruby
bundle exec rake db:seed
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

##### 6. Start the Sidekiq server

Start sidekiq from the root of your Rails application so the jobs will be processed:

```ruby
bundle exec sidekiq
```
