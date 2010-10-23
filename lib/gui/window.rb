class Window < Gtk::Window
  
  include Singleton
  
  attr_reader :panel
  
  def initialize title = "Pomo-ruby"
    super
    
    @panel = Panel.new
    
    self.add panel
    self.show_all
    self.title = title
    self.allow_grow = false
    self.window_position = Gtk::Window::POS_CENTER_ALWAYS
    
    icon_path = File.dirname(__FILE__)+"/../images/tomato.png"
    
    self.icon = Gdk::Pixbuf.new icon_path

    add_close_event
  end
  
  def pop_up
    self.keep_above = true
    self.keep_above = false
  end
  
  def show_warning_dialog message
    dialog = create_warning_dialog message
    dialog.run
    dialog.destroy
  end
  
  private 
  
  def create_warning_dialog message
    dialog = Gtk::MessageDialog.new(
      self, 
      Gtk::Dialog::MODAL,
      Gtk::MessageDialog::WARNING,
      Gtk::MessageDialog::BUTTONS_CLOSE,
      message
    )
                                
    dialog.window_position = Gtk::Window::POS_CENTER_ALWAYS
    dialog
  end
  
  def add_close_event
    self.signal_connect "destroy" do
      puts "Exiting pomo-ruby..."
      Gtk.main_quit
    end
  end  
  
end
