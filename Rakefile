require 'rubygems'
require 'rake'

# ----- Default: Testing ------

task :default => :test

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/test_*.rb'
  test.verbose = true
end

namespace :test do
  desc 'Test growl messages sent to localhost'
   Rake::TestTask.new(:local_notification) do |t|
     t.libs << 'lib' << 'test'
     t.pattern = 'test/local_notifications/test_*.rb'
     t.verbose = true
     # t.warning = true
   end
   
   
   desc 'Test growl messages sent to remote hosts'
   Rake::TestTask.new(:remote_notification) do |t|
     t.libs << 'lib' << 'test'
     t.pattern = 'test/remote_notifications/test_*.rb'
     t.verbose = true
     # t.warning = true
   end
end