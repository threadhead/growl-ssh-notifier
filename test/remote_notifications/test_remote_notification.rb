require 'test/test_helper'
require 'yaml'

class TestRemoteNotifications < Test::Unit::TestCase
 
  def setup
    # load the hosts from the yaml file: remote_hosts.yaml
    
  end
  
  def test_true
    assert true
  end
  
  
  
  # def test_remote_command_on_remote
  #   @rec.send_notification('Test Title', 'This is a test message sent with GrowlSSHNotifier.')
  #   @rec.application_icon = "Mail"
  #   @rec.send_notification('Test with Mail Icon', 'This is a test message sent with GrowlSSHNotifier.')
  # end

end