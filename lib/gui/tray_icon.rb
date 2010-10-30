class TrayIcon < Gtk::StatusIcon
  
  include Singleton
  
  def initialize
    super

    icon_image = Gdk::Pixbuf.new Window::ICON_PATH
    self.pixbuf = icon_image
    self.tooltip='StatusIcon'

    @menu = TrayMenu.new

    add_pop_menu_event
    add_click_event
  end
  
  def add_pop_menu_event
    self.signal_connect 'popup-menu' do |tray, button, time| 
      @menu.popup(nil, nil, button, time)
    end
  end
  
  def add_click_event
    self.signal_connect "activate" do
      Window.instance.toggle_visibility
    end
  end
  
end


