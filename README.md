# ReadMistypes

Converts mistyped strings in wrong keymap ("ghbdtn" -> "привет").

Only english/russian mistypes for now. 
**This gem in experimental stage.**

See also [languager](https://github.com/aishek/languager) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'read_mistypes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install read_mistypes

## Usage

```ruby
ReadMistypes::convert_mistypes('Ghbdtn мир!') # => 'Привет, мир!'
```

Or with explicit language:

```ruby
ReadMistypes::convert_mistypes('Ghbdtn мир!', :ru) # => 'Привет, мир!'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zuf/read_mistypes.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
