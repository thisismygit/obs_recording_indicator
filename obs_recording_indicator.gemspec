# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'obs_recording_indicator/version'

Gem::Specification.new do |spec|
  spec.name          = "obs_recording_indicator"
  spec.version       = ObsRecordingIndicator::VERSION
  spec.authors       = ["Empty"]
  spec.email         = ["no@email.plzplz"]

  spec.summary       = %q{This gem just watches OBS' logs and finds out when OBS is recording and not.}
  spec.homepage      = "https://github.com/thisismygit/obs_recording_indicator"
  spec.license       = "GPLv3" # uncomment and replace with GPLv3, etc.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_dependency "bundler", "~> 1.16"
  spec.add_dependency "file-tail"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
