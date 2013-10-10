# Languess

[![Build Status](https://travis-ci.org/defsprite/languess.png)](https://travis-ci.org/defsprite/languess) [![Code Climate](https://codeclimate.com/github/defsprite/languess.png)](https://codeclimate.com/github/defsprite/languess)

Languess guesses the favourite language of any given github user. It consists of a small web frontend written in sinatra and a mini textual command line interface.

## Installation

Run `bundle install` once. In case you are not using rvm or another gemset manager, prefix all commands using `bundle exec`.

## Command line

Just call `(bundle exec) bin/languess`, like so:

```
$ (bundle exec) bin/languess tenderlove
Ruby
```

## Web application

Start the Sinatra application as follows:

```
(bundle exec) rackup
```

You should now be able to access the mini web frontend on `localhost:4567`


