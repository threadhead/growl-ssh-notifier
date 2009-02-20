require 'rubygems'
# this module will execute growlnotify on remote Mac computers using ssh
# the reason is that the ruby-growl gem does not support custom icons, plus
# when it fails it has closed serial ports (reason unknown)

class GrowlSSHNotifierError < StandardError; end

module GrowlSSHNotifier
  class Receiver
    attr_accessor :growlnotify_path, :application_icon, :icon_type, :icon_file_path, :image_file_path
    attr_accessor :ssh_timeout
    attr_reader :host, :user, :password
    
    def initialize(host, user=nil, password=nil)
      @growlnotify_path = '/usr/local/bin/growlnotify'
      @host = host
      @user = user
      @password = password
      @application_icon = nil
      @icon_type = nil
      @icon_file_path = nil
      @image_file_path = nil
      @ssh_timeout = 2
      raise GrowlSSHNotifierError, 'must supply an ip address' if host.nil? || host.empty?
    end
    
    
    def with_password?
      !@password.nil?
    end
    
    
    def send_notification(title, message)
      if self.with_password?
        require 'net/ssh'
        Net::SSH.start(@host, @user, :password => @password, :timeout => @ssh_timeout) do |ssh|
          result = ssh.exec! remote_command(title, message)
        end
        
      else
        if ip_local?
          result = `#{remote_command(title, message)}`
        else
          result = `ssh #{@host} \"#{remote_command(title, message)}\"`
        end
      end
      
    end
    
    
    def remote_command(title, message)
      @growlnotify_path <<
      title_arg(title) <<
      message_arg(message) <<
      application_icon_arg <<
      icon_type_arg <<
      icon_file_path_arg <<
      image_file_path_arg
    end
    
    
    def ip_local?
      @host == 'localhost' || @host == '127.0.0.1'
    end
    
    
    
  private
    def title_arg(title)
      title ? " -t \'#{title}\'" : ''
    end
    
    def message_arg(message)
      message ? " -m \'#{message}\'" : ''
    end
    
    def application_icon_arg
      @application_icon ? " -a \'#{@application_icon}\'" : ''
    end
    
    def icon_type_arg
      @icon_type ? " -i \'#{@icon_type}\'" : ''
    end
    
    def icon_file_path_arg
      @icon_file_path ? " -I \'#{@icon_file_path}\'" : ''
    end
    
    def image_file_path_arg
      @image_file_path ? " --image \'#{@image_file_path}\'" : ''
    end
  end

end