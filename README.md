# Octostar

**Now it's only prototype**

Improved search for your starred github repositories

![main page](https://cloud.githubusercontent.com/assets/1147484/26133387/4ff73cb8-3aaf-11e7-84a2-84d4ef8899d8.jpeg)

## Motivation

## How to use
1. open site
2. login by github
3. put query to firld and that's all

### Queries
```
You can use filters like:
- **author** search by author;
- **tag** search by specific tag (can be 1+);
- **lang (language)** search by language;

Examples (if you starred devise):

```
author:plataform lang:ruby tag:rails authentication solution
```

## Development

1. clone project
2. call this commands (for `HANAMI_ENV=test` too)
```
bundle exec hanami db create
bundle exec hanami db migrate
```

3. check tests (`bundle exec rspec`)
4. that's all

## TODO
* tests
* implement sync repos button
* add development part to readme
* add "push to heroku" button to readme
* display error if option not found

## Copyright

Released under MIT License.

Copyright © 2017 Anton Davydov.
