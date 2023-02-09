# UnderdogRubyStyle

This repository provides recommended RuboCop configuration and additional cops for use on Underdog Ruby projects, and is the home of Underdog's Ruby style guide.
## Installation

Add the gem to your application's Gemfile:

```ruby
group :development, :test do
  gem "underdog_ruby_style", github: "Underdog-Inc/underdog_ruby_style", branch: "main"
end
```

Or pin it to a version:

```ruby
group :development, :test do
  gem "underdog_ruby_style", github: "Underdog-Inc/underdog_ruby_style", tag: "0.1.0"
end
```

Add it to the top of your rubocop configuration:

```yaml
inherit_gem:
  underdog_ruby_style:
    - default.yml

# Include cops you'd like to add or overwrite below
```

## Making Changes

Pull requests are welcome from everyone. Changes and standards can be discussed via the pull request process. For a change to be "ratified" we just need an approval from each team.
