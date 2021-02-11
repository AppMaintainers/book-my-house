# Book My House

At this stage of the interview process, you'll be introduced to a very simple Ruby on Rails application, on which you'll
have to do a number of exercises. Our goal with this is to examine the various skill sets you have. Let me just point
that out, that you do NOT need to finish all the exercises in order to succeed. We'd rather like to learn the way you
think, solve problems and your general knowledge on the topic by watching you work, than to just discuss the sheer
number of LoC you wrote.

The application you'll be working with today is practically a "guesthouse management app". You can book for a specific
date, which will then be displayed on the main page. You're encouraged to try out it's functionality before starting any
of the exercises.

If you come across an obstacle which proves to be difficult, feel encouraged to ask us anything! We'll be glad to answer
or ask some leading questions. (Or just utilize Google, StackOverflow or https://guides.rubyonrails.org/ to your
liking.)

We will provide the tasks later.

I wish you success!

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing
purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You'll need to set up you development environment to be able to start the project. You can read the required list in
the `.tool-versions` file.

#### Linux or macOS

1. Get [asdf-vm](https://asdf-vm.com/#/core-manage-asdf)
2. Install required plugins
    ```bash
    asdf plugin add ruby
    asdf plugin add nodejs
    asdf plugin add yarn
    asdf plugin add sqlite
    ```
3. Install tools
    ```bash
    asdf install
    ```

#### Windows

TODO: add windows instructions

### Installing

After installing the [Prerequisites](#prerequisites), you need to

1. Install all dependencies
    ```bash
    bundle install
    yarn install
    ```
2. Create the database
    ```bash
    rails db:setup
    ```
3. Finally start your local development server
    ```bash
    rails s
    ```
4. Optionally you can run webpacker dev server to speed up asset handling
    ```bash
    bin/webpack-dev-server
    ```

## Running the tests

For automated tests, we are using Rails' defaults

### Break down into end to end tests

You can run the test suit with `rails test`

### And coding style tests

We haven't introduced linters yet, but we're planning to adapt Rubocop.

## Deployment

Currently we don't have deployment workflow as it's just a demo application

## Built With

- [Ruby on Rails](https://rubyonrails.org/) - Core framework
- [Sqlite3](https://www.sqlite.org/) - Used for development database

## Contributing

We are not accepting Pull Requests, see [Tasks](TASK.md) for exercises.

## Versioning

We are using rolling release to update this demo app from time to time.

## Authors

- [App Maintainers ltd.](https://www.appmaintainers.com)
- See [individual contributors](https://github.com/AppMaintainers/book-my-house/graphs/contributors) on github
