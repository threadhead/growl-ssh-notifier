require 'test/test_helper'

class TestGrowlSSHNotifier < Test::Unit::TestCase
  def setup
    @rec = GrowlSSHNotifier::Receiver.new('192.168.0.3')
  end
  
  
  # def test_remote_command_on_local_machine
  #   rec = GrowlSSHNotifier::Receiver.new("localhost")
  #   # rec.send_notification('Test Title', 'This is a test message sent to the local machine with GrowlSSHNotifier.')
  # end
  # 
  # 
  # def test_remote_command_on_local_machine
  #    rec = GrowlSSHNotifier::Receiver.new("localhost")
  #   # rec.send_notification('Test Title', 'This is a test message sent to the local machine with GrowlSSHNotifier.')
  # end
  # 
  # 
  # def test_remote_command_on_remote
  #   @rec.send_notification('Test Title', 'This is a test message sent with GrowlSSHNotifier.')
  #   @rec.application_icon = "Mail"
  #   @rec.send_notification('Test with Mail Icon', 'This is a test message sent with GrowlSSHNotifier.')
  # end

end