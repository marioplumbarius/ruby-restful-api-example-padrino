# Padrino's RESTFul API example

[![Build Status](https://travis-ci.org/marioluan/ruby-web-frameworks-examples.svg?branch=master)](https://travis-ci.org/marioluan/ruby-web-frameworks-examples)
[![Code Climate](https://codeclimate.com/github/marioluan/ruby-web-frameworks-examples/badges/gpa.svg)](https://codeclimate.com/github/marioluan/ruby-web-frameworks-examples)
[![Test Coverage](https://codeclimate.com/github/marioluan/ruby-web-frameworks-examples/badges/coverage.svg)](https://codeclimate.com/github/marioluan/ruby-web-frameworks-examples/coverage)
***

## Getting Started:

pre-requisites:
- ruby 2.2.3
- bundler
- sqlite

### install dependencies
```shell
$ bundle install
```

### run the migrations
```shell
$ padrino ar:migrate
```

### run unit tests
```shell
$ rspec
# Test coverage report will be available at ./coverage/index.html
```

### check code style
```shell
$ rubocop -S
```

# start the app
```shell
$ ./bin/restful_api
```

TODOs:
- basic auth and JWT ( https://github.com/jwt/ruby-jwt, https://scotch.io/tutorials/authenticate-a-node-js-api-with-json-web-tokens, https://auth0.com/blog/2014/12/02/using-json-web-tokens-as-api-keys/)
- translations
- create API to purge cache entries