# Padrino's RESTFul API example

[![Code Climate](https://codeclimate.com/github/marioluan/ruby-web-frameworks-examples/badges/gpa.svg)](https://codeclimate.com/github/marioluan/ruby-web-frameworks-examples)
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
```

# start the app
```shell
$ ./bin/restful-api
```

TODOs:
- associations
- translations
- searcheble api
- pageable api
- cache
- basic auth and JWT ( https://github.com/jwt/ruby-jwt, https://scotch.io/tutorials/authenticate-a-node-js-api-with-json-web-tokens, https://auth0.com/blog/2014/12/02/using-json-web-tokens-as-api-keys/)