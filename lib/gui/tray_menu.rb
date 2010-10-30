class TrayMenu < Gtk::Menu
  
  def initialize
    super
    
    quit = Gtk::ImageMenuItem.new(Gtk::Stock::QUIT)
    quit.signal_connect('activate'){Gtk.main_quit}
    
    self.append(quit)
    self.show_all
    
    add_pop_menu_event
  end  
  
  private
  
  def add_pop_menu_event
    self.signal_connect 'popup-menu' do |tray, button, time| 
      self.popup(nil, nil, button, time)
    end
  end
  
end

