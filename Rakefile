# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'spec/rake/spectask'
require 'tasks/rails'
gem 'ci_reporter'
require 'ci/reporter/rake/rspec'
require 'rcov'

namespace :spec do
  desc "do rspec tests and test coverage"
  Spec::Rake::SpecTask.new('rcov') do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ['--format html:results/spec_results.html']
    t.warning = true
    t.rcov = true
    t.rcov_dir = 'coverage'
    t.rcov_opts = ['--exclude', "kernel,load-diff-lcs\.rb,instance_exec\.rb,lib/spec.rb,lib/spec/runner.rb,^spec/*,bin/spec,examples,/gems,/Library/Ruby,\.autotest,#{ENV['GEM_HOME']}",'-I', 'lib/']
  end
end
