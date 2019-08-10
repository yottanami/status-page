
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "status/page/version"

Gem::Specification.new do |spec|
  spec.name          = "status-page"
  spec.version       = Status::Page::VERSION
  spec.authors       = ["yottanami"]
  spec.email         = ["yottanami@gmail.com"]

  spec.summary       = "Service status puller"
  spec.description   = "A command-line tool that will pull status information from different services, displays the results and saves it into a data store."
  spec.homepage      = "http://github.com/yottanami/status-page"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = ""

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "http://github.com/yottanami/status-page"
    spec.metadata["changelog_uri"] = "http://github.com/yottanami/status-page"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 11.0"

  spec.add_dependency "thor", "~> 0.20"
end
