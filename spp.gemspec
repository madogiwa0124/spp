
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spp/version"

Gem::Specification.new do |spec|
  spec.name          = "spp"
  spec.version       = Spp::VERSION
  spec.authors       = ["madogiwa"]
  spec.email         = ["madogiwa0124@gmail.com"]

  spec.summary       = %q{spp is super pretty print library. }
  spec.homepage      = "https://github.com/Madogiwa0124/spp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.33.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "timecop", "~> 0.8"
end
