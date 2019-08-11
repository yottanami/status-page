# Status::Page
A command-line tool that will pull status information from different services, displays the results and saves it into a data store.

## Usage
After downloading the project, enter to the directory of project and then run:
```
bundle install
```
now you can run the program using bundle exec
```
bundle exec exe/status-page
```

### pull
pull all the status page data from different providers and save into the data store.
```
bundle exec exe/status-page pull
```

### live
pull all the status page data from different providers and save into the data store.

```
bundle exec exe/status-page live
```

### history
Display all the data which was gathered by the tool
```
bundle exec exe/status-page history
```

### backup
Takes a path variable, and creates a backup of historic and currently saved data.
```
bundle exec exe/status-page backup <path>
```

### restore
Takes a path variable which is a backup created by the application and restores that data
```
bundle exec exe/status-page restore <path>
```

## Next features
- Save each service result in different file and use different thread.
- calculation and save the results as checkpoints to easier access for reports
- improve restore process to ask user to append
- Split big backups and update the checkpoints
- improve comand-prompt interface


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/status-page.
