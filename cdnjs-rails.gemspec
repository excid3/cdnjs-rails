# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|

  s.authors           = ["Chris Hough"]
  s.email             = ["founders@noconformity.com"]
  s.description       = %q{Use the CDNJS CDN to serve files and fall back to the local version if the CDN is unreachable.}
  s.summary           = %q{A gem to serve CDNJS files with fall back protection.}
  s.homepage          = "https://github.com/chrishough/cdnjs-rails"

  s.files             = `git ls-files`.split("\n")
  s.require_paths     = ["lib"]

  s.name              = "cdnjs-rails"
  s.licenses          = "GPL"
  s.version           = '1.0.0'

end

