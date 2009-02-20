require 'rubygems'
require 'rake'

# ----- Default: Testing ------

task :default => :test

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  test_files = FileList['test/test_*.rb']
  t.test_files = test_files
  t.verbose = true
end

namespace :test do
  
  desc 'Test growl messages sent to localhost'
  
end