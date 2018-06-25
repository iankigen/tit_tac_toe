lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tic_tac_toe/version"

Gem::Specification.new do |spec|
  spec.name = "tic_tac_toe"
  spec.version = TicTacToe::VERSION
  spec.authors = ["Ian Kigen"]
  spec.email = ["ian.gabe.ian@gmail.com"]

  spec.summary = %q{tit_tac_toe}
  spec.description = %q{Tic-tac-toe is a paper-and-pencil game for two players, X and O, who take turns marking the
spaces in a 3×3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical,
 or diagonal row wins the game}
  spec.homepage = "https://github.com/iankigen/tit_tac_toe"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
