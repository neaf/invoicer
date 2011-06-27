# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{get_invoice}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tomasz Werbicki"]
  s.date = %q{2011-06-27}
  s.description = %q{Common API for managing invoices from different online accounting services.}
  s.email = %q{tomasz@werbicki.net}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "get_invoice.gemspec",
    "lib/invoice.rb",
    "lib/invoicer.rb",
    "lib/services/blinksale.rb",
    "lib/services/blinksale/invoice.rb",
    "lib/services/blinksale/invoice_manager.rb",
    "lib/services/harvest.rb",
    "lib/services/harvest/invoice.rb",
    "lib/services/harvest/invoice_manager.rb",
    "spec/services/blinksale_spec.rb",
    "spec/services/harvest_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/neaf/invoicer}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Common API for managing invoices from different online accounting services.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<invoice_harvester>, [">= 0"])
      s.add_runtime_dependency(%q<blinksale>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<invoice_harvester>, [">= 0"])
      s.add_dependency(%q<blinksale>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<invoice_harvester>, [">= 0"])
    s.add_dependency(%q<blinksale>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

