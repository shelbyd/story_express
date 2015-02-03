# StoryExpress

Story Express delivers all the stories you've marked as finished.
We recommend to use it at the end of your CI build once the stories have been deployed to an environment where your PM can accept.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'story_express'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install story_express

## Usage

**Currently only supports tracker projects.**

Story Express delivers stories that are found by grepping git logs for ```finishes #STORY_ID```.
So, to work with story express, add ```finishes #12345678``` to your commit messages that finish a story.

You need your tracker project id and a tracker API key.
Set the ```TRACKER_PROJECT_ID``` and ```TRACKER_TOKEN``` to your project id and API key respectively.
Then, running ```story_express``` will deliver all your finished stories.

## TODO

* Support other agile tracking systems (JIRA primarily)
* Accept inputs as command-line arguments
* Allow for customization of matching commit messages

## Contributing

1. Fork it ( https://github.com/shelbyd/story_express/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
