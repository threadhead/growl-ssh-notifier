require 'test/test_helper'
require 'yaml'

class TestRemoteNotification < Test::Unit::TestCase
 
  def setup
    # load the hosts from the yaml file: remote_hosts.yml
    host_file = File.join(File.dirname(__FILE__), 'remote_hosts.yml')
    if File.file? host_file
      @receivers = []
      
      File.open host_file do |yf|
        YAML.each_document( yf ) do |ydoc|
          ydoc.each do |rec|
            if rec[1].has_key?('user')
              @receivers << GrowlSSHNotifier::Receiver.new(rec[1]['host'], rec[1]['user'], rec[1]['password'])
            else
              @receivers << GrowlSSHNotifier::Receiver.new(rec[1]['host']) 
            end
          end
        end
      end
      
    else
      raise 'remote_host.yml file not found, copy and edit remote_hosts_example.yml'
    end
  end
  
  
  def test_remote_command_on_remote
    @receivers.each do |rec|
      rec.send_notification('Test Title', 'This is a test message sent with GrowlSSHNotifier.')

      rec.application_icon = "Mail"
      rec.send_notification('Test with Mail Icon', 'This is a test message sent with GrowlSSHNotifier.')
    end
  end

end