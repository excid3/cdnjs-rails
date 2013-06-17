# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|

  s.authors           = ["Chris Hough"]
  s.email             = ["founders@noconformity.com"]
  s.description       = %q{Use the Google CDN to serve jquery and fall back to the local version if the CDN is unreachable.}
  s.summary           = %q{A gem to serve jQuery from the Google CDN with fall back protection.}
  s.homepage          = "https://github.com/chrishough/jquery-rails-google-cdn"

  s.files             = `git ls-files`.split("\n")
  s.require_paths     = ["lib"]

  s.name              = "jquery-rails-google-cdn"
  s.licenses          = "GPL"
  s.version           = '0.0.5'

end

