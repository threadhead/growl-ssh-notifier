require 'test/test_helper'

class TestLocalNotification < Test::Unit::TestCase
  
  def test_remote_command_on_local_machine
    rec = GrowlSSHNotifier::Receiver.new("localhost")
    rec.send_notification('Test Message', 'This is a test message sent to the LOCALHOST machine with GrowlSSHNotifier.')
    
    rec = GrowlSSHNotifier::Receiver.new("localhost", { :application_icon => 'Mail' })
    rec.send_notification('Test Message', 'This is a test message sent to the LOCALHOST machine with GrowlSSHNotifier.')
  end

end