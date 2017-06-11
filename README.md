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
2. setup github key and secret in `.env.development` file
3. call this commands (for `HANAMI_ENV=test` too)

```
bundle exec hanami db create
bundle exec hanami db migrate
```

4. check tests (`bundle exec rspec`)
5. start server (`bundle exec hanami s`)
6. open `localhost:2300` and login
7. open console (`bundle exec hanami c`) and run `UpdateProjectsWorker.new.perform`
8. that's all

## Copyright

Released under MIT License.

Copyright © 2017 Anton Davydov.
