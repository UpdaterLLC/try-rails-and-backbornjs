try-rails-and-backbornjs
========================

== README

This README would normally document whatever steps are necessary to get the
application up and running.


(sorry for my broken English)


# System dependencies

* ruby 2.1.2
* rails 4.1.4
* postgresql 9.3
* rspec

and developing with Rubymine 6.3.3.

# Configuration

cloning

    $ git clone https://github.com/sato1043/try-rails-and-backbornjs.git

bundle install

    $ cd try-rails-and-backbornjs
    $ bundle install --path vender/bundle


# Database initialization

before you create database, confirm to connect your database server.
we assume that you use postgresql (>=9.3).

if you can't connect postgresql server, check your pg_hba.conf.
peer connection must have same name, same password between *NIX user and postgresql DB user role.
(if you so, you need root privilege)

    $ sudo vi /etc/postgresql/9.3/main/pg_hba.conf 
     :
    # "local" is for Unix domain socket connections only
    #local   all  all    peer
    local    all  all    md5
     :

after changing pg_hba.conf, restart server. we in ubuntu,

    $ sudo /etc/init.d/postgresql restart

and user to connect in database.yml,

    $ vi config/database.yml 
     :
    default: &default
     :
      username: try-rails-and-backbornjs
      password: try-rails-and-backbornjs
     :

password can be below. (shell variable must export)

    password: <%= ENV['TRY_RAILS_AND_BACKBORNJS_DATABASE_PASSWORD'] %>

so we can create database.

    $ sudo -u postgres createuser try-rails-and-backbornjs
    $ sudo -u postgres psql
     :
    postgres=# ALTER ROLE "try-rails-and-backbornjs" WITH CREATEDB;
     :
    $ bundle exec rake db:create RAILS_ENV=development
    $ bundle exec rake db:create RAILS_ENV=test


# How to create docs

    $ bundle exec rake doc:app

# How to run the test suite

    $ bundle exec rake spec
    $ bundle exec rake spec:javascript

# Services (job queues, cache servers, search engines, etc.)

TBD

# Deployment instructions

TBD


# Contributes

    $ git checkout -b feature/awesome_func
     :
     (edit)
     :
    $ git commit -m '#awesome_func awesome_func added'
    $ git commit -m '#awesome_func and some fix'
    $ git pull origin/development
     :
     (resolve conflicts)
     :

then pls send pull request. i welcome any kind of proposal :)


# Legals

pls see the LICENSE file.
we distribute this software with the MIT license.

__END__