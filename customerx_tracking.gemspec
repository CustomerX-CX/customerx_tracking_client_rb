# frozen_string_literal: true
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "lib/customerx_tracking/version"

Gem::Specification.new do |spec|
  spec.name          = "customerx_tracking"
  spec.version       = CustomerxTracking::VERSION
  spec.authors       = ["Ricardo Grassi"]
  spec.email         = ["ricardo.grassi@customerx.cx"]

  spec.summary       = "CustomerX Tracking REST API Client"
  spec.description   = "Ruby wrapper for the REST API at https://www.customerx.cx. Documentation at https://www.customerx.cx/developers."
  spec.homepage      = "https://www.customerx.cx/developers/"
  spec.license       = "MIT"
  spec.required_ruby_version     = ">= 2.3"
  spec.required_rubygems_version = ">= 1.3.6"

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/CustomerX-CX/customerx_tracking_client_rb/issues',
    'changelog_uri' => "https://github.com/CustomerX-CX/customerx_tracking_client_rb/CHANGELOG.md",
    'documentation_uri' => "https://rubygems.org/gems/customerx_tracking/versions/#{spec.version}"
  }

  spec.files = Dir.glob('{lib,util}/**/*')
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", ">= 0.9.0", "< 2.0.0"
end
