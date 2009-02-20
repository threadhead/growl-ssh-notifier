require 'test/test_helper'

class TestLocalNotifications < Test::Unit::TestCase
  
  def test_remote_command_on_local_machine
    rec = GrowlSSHNotifier::Receiver.new("localhost")
    rec.send_notification('Test Message', 'This is a test message sent to the LOCALHOST machine with GrowlSSHNotifier.')
  end

end