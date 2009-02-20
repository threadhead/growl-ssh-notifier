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
   Rake::TestTask.new(:local_notification) do |t|
     t.test_files = FileList['test/local_notifications/test_*.rb']
     t.verbose = true
     t.warning = true
   end
   
   
   desc 'Test growl messages sent to remote hosts'
   Rake::TestTask.new(:remote_notification) do |t|
     t.test_files = FileList['test/remote_notifications/test_*.rb']
     t.verbose = true
     t.warning = true
   end
end