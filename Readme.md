# Documentation
## Development Env and Features
* created a Ruby project and initialized the `Gemfile`

then executed

  ```
    $ rspec --init
  ```

  to set up test environment

The gems and dependencies reported below were then installed:

* `gem 'pry'`
* `gem 'pry-byebug'`

These two gems were added in order to debug the app.
Add `require 'pry'` at the top of the file where you need debugging,
then add `binding.pry` within the method you want to investigate and run either the app or the tests.

Debugging activity won't be tracked as `.byebug_history` was added to `.gitignore`

* `gem 'rubocop', require: false`

This gem was added in order to analyze and format the code according to
ruby standard guidelines reported on [Ruby Style Guides](https://rubystyle.guide/)

* `gem 'simplecov', require: false, group: :test`

Added this gem in order to keep track of overall coverage tests results for the project.
After running test, check the coverage report which is generated:
```
  Coverage report generated for RSpec to /../../../../novicap/coverage. 178 / 178 LOC (100.0%) covered.
```

You can find a screenshot of the report in `coverage/assets`.

run `open coverage/index.html` to open the file in your browser and check the report.

* `# frozen_string_literal: true`

Added this feature to the project to optimise space complexity and do not allocate new space in memory
for the same string

## Notes
I decided to create a `Checkout` class inside which we calculate the price of the items in the cart
and when it comes to check whether discounts apply or not I decided to call the `Factory Method` pattern
which generates promos based on the informations we pass in.

I created a main `MinItemsPerPromo` class which initialise the minimun number of items required to apply promos and the new price value for the items. Then, each new promo class we create (so far we created `BuyXgetYfree` and `BulkPurchase`) will inherit from this class to apply those attributes.

I opted for this Inheritance approach because it's dynamic (every child class will have its minimun number of items required and its value which can vary) and because it's easily maintanable and scalable.

I decided to apply the  [Factory Method Pattern](https://bogdanvlviv.com/posts/ruby/patterns/design-patterns-in-ruby.html) for several reasons:

* This approach separates the `PromoGenerator` construction code from the `Checkout` code that actually uses it. Therefore it’s easier to extend the `PromoGenerator` construction code independently from the rest of the code.

* I wanted to provide a way to extend its internal properties when necessary. (from requirements sheet "Something that’s easy to work with, because we’ll play with the business logic in the next session")

* I wanted to optimise system resource and re-use exsisting objects.

## Prerequisites
Before to begin, make sure you have ruby version >=2.4.4 installed.

If your ruby version does not match, you can update it with a ruby version manager like rvm or rbenv.

```
# when using rbenv
rbenv install 2.4.4
```

```
# set 2.4.4 as the local version for this project
rbenv local 2.4.4
```

```
# when using rvm
rvm install 2.4.4
# set 2.4.4 as the local version
rvm use 2.4.4
```

## Installation
Clone the repo and then:
```
  $ cd factory-store
```
execute:
```
  $ bundle install
```
to install dependencies

then execute:
```
  $ rake
```

or
```
  $ rspec
```

anytime you need to run tests. Check for test coverage snapshot

Ultimately, execute either
```
  $ rubocop
```
or
```
  $ rbenv exec rubocop
```
depending on configuration you have set for you bash profile to format the code.

At this stage the only correctable offense is `Metrics/BlockLength` for `spec/checkout_spec.rb` which I didn't address not to delete test cases.

## Running the app
You can run the app executing the script:
```
  $ ruby lib/checkout.rb
```

and print out on terminal the `Examples` results provided upon requirements.
