Gem::Specification.new do |s|
  s.name         = "prag_studio_fund"
  s.version      = "1.0.1"
  s.author       = "Waihon Yew"
  s.email        = "yewwaihon@gmail.com"
  s.homepage     = "https://github.com/waihon/prag_studio_fund"
  s.summary      = "Pragmatic Studio's Ruby Programming's Bonus App."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'crowdfund' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 3.5'
end
