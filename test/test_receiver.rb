require 'test/test_helper'

class TestGrowlSSHNotifier < Test::Unit::TestCase
  def setup
    @rec = GrowlSSHNotifier::Receiver.new('192.168.0.3')
  end
  
  def test_create_new_receiver_instance
    assert_instance_of(GrowlSSHNotifier::Receiver, @rec)
    assert_nil(@rec.password)
    assert_nil(@rec.user)
    assert_equal(false, @rec.with_password?)
  end
  
  
  def test_create_new_receiver_without_ip_address_fails
    assert_raise(GrowlSSHNotifierError) { GrowlSSHNotifier::Receiver.new("") }
  end
  
  
  def test_new_receiver_with_password
    rec = GrowlSSHNotifier::Receiver.new("192.168.0.2", 'frank', 'sekrit')
    assert_equal(true, rec.with_password?)
  end
  
  
  def test_local_ssh
    assert_equal('ssh 192.168.0.3 ', @rec.ssh_no_password)
  end
  
  
  def test_remote_command
    @rec.growlnotify_path = 'growlnotify'
    assert_equal("growlnotify -t 'test_title' -m 'test_message'", 
                  @rec.remote_command('test_title', 'test_message'))
  end


  def test_remote_command_with_application_icon
    @rec.growlnotify_path = 'growlnotify'
    @rec.application_icon = "Safari"
    assert_equal("growlnotify -t 'test_title' -m 'test_message' -a 'Safari'",
                  @rec.remote_command('test_title', 'test_message'))
  end
  

end