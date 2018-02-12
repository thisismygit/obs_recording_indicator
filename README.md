# ObsRecordingIndicator

This Gem will open your OBS logs folder, figure out the current log file, and then parse it to determine when you start and stop recording.  With this gem you can add a few lines of code to signal other systems (an LCD display?) to tell you whether you're recording or not.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'obs_recording_indicator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install obs_recording_indicator

## Usage

```
$  obs_recording_indicator
READING...
IT STARTED
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/obs_recording_indicator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
