---
title: Free automated code reviews using Pronto
date: 2016-04-11 12:02 UTC
tags: ruby, rubocop, pronto, reviews, code style
category: software developer
---

## Code style
Officially or unofficially, every dev team has it's [code style](https://en.wikipedia.org/wiki/Programming_style). And hopefully, the means to enforce it, as well.

 *De facto* standard way to enforce it is via pull requests where some other team member will check your code for violations so you can fix'em.

So the obvious questions come:

- **is there any generally accepted code style?**
- **can that be automated?**

Yes and yes. Depending on language used.

#### Language
Here, we will be talking about [Ruby](https://www.ruby-lang.org/en/).

It does not have official guide, but there is community driven one at [GitHub](https://github.com/bbatsov/ruby-style-guide)  documenting Ruby coding style and best practices.

#### Tools
There are some paid tools that we could use like [Codacy](https://codacy.com/) or [HoundCI](https://houndci.com/), but as title says, we would like to use something free, so here comes [Pronto](https://github.com/mmozuras/pronto).

 > Pronto runs analysis quickly by checking only the relevant changes. Created to be used on pull requests, but also works locally. Perfect if want to find out quickly if branch introduces changes that conform to your styleguide, are DRY, don't introduce security holes and more.

### Scenario
For the sake of this article, let's assume the following workflow:

- create code locally (let's say Rails app)
- push code to Github
- create pull request on Github
- get some tests running via TravisCI or CircleCI
- prosper

## Getting ready
Assuming we are on Rails, let's create new branch and add the following gems to Gemfile.

```
group :development, :test do
  # Pronto
  gem 'pronto'
  gem 'pronto-rubocop', require: false
end
```

We need to add `pronto` gem, so we can include some of its runners like `pronto-rubocop`. Runners are various tools and libraries that actually check the code. [Rubocop](https://github.com/bbatsov/rubocop) checks the usage of previously mentioned Ruby style.

We should not require them, as some of them might be using monkey-patching to do their job. As we wanna run them only locally and on CI only, the best practice is to add them to `group :development, :test`.

### Bad code.

Let's write some bad code.

```
class Bad
  def what
    "Not"
    'Cool'
  end
end
```

Now we can `pronto run`  and see some recommendations from rubocop.

```
bad.rb:1 I: Missing top-level class documentation comment.
bad.rb:3 W: Literal `"Not"` used in void context.
bad.rb:3 I: Prefer single-quoted strings when you don't need string interpolation or special symbols.
```
Nice.

## Running on CI and Github

Running locally is great, but we wanna comment on PRs, right?

### Neat-freak
To be able to comment on PRs, we need to act as some person. We can either use some existing one, but I think that the best way is to create new one.

Once we have one, we will need its [Personal Access Token](https://github.com/settings/tokens). Generate one and paste it to ENV variable (or however you do it). Obviously it's not something to share.

We will use it in config file `.pronto.yml`

```
github:
  slug: user-name/repo
  access_token: ENV["GITHUB_ACCESS_TOKEN"]
  api_endpoint: https://api.github.com/
  web_endpoint: https://github.com/
max_warnings: 150
verbose: false
```

Next we add our new guy as contributor to `repo`.

Sweet. Neat Freak can now comment on Github. (We should not forget to add this value to our CI service as well. )

### TravisCI

Now let's configure good old Travis via `.travis.yml`.

```
script:
  - bundle exec rake test
  - 'PULL_REQUEST_ID=${TRAVIS_PULL_REQUEST} bundle exec pronto run -f github_pr'
```

We'e just told Travis to run pronto after tests. `TRAVIS_PULL_REQUEST` is the same as GH's pull request id, so we are cool.

### CircleCI

In case you are using CircleCI, you will need to add something like this to `circle.yml`.

```
test:
  post:
    - 'PULL_REQUEST_ID=${CI_PULL_REQUEST##*/} bundle exec pronto run -f github_pr'
```

CircleCI doesn't store GH's pull request id, so we used a bit of magic to get it from `CI_PULL_REQUEST`.


### Once again
Do not forget to add `GITHUB_ACCESS_TOKEN` to your CI service.

## Push vs Pull Request
In TravisCI, you can set whether you want to run your tests on pull requests and/or pushes.  
Obviously, with pushes you will get errors because there is no `TRAVIS_PULL_REQUEST`.

Here is little fix:  

```
- 'if [ "$TRAVIS_PULL_REQUEST" == false ]; then echo "TRAVIS_PULL_REQUEST is unset, skipping Pronto"; else PULL_REQUEST_ID=${TRAVIS_PULL_REQUEST} bundle exec pronto run -f github_pr; fi'

```

## Profit
Now we can see comments in PR's once code style problems are found. And of course we can configure style guide. To see how, just go see how runners/respective tools do it.
