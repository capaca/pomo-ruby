class Window < Gtk::Window
  
  include Singleton
  
  ICON_PATH = File.dirname(__FILE__)+"/../images/tomato.png"
  
  attr_reader :panel
  
  def initialize title = "Pomo-ruby"
    super

    icon_image = Gdk::Pixbuf.new ICON_PATH
    
    @panel = Panel.new
    
    self.icon = icon_image
    self.add panel
    self.show_all
    self.title = title
    self.allow_grow = false
    self.window_position = Gtk::Window::POS_CENTER_ALWAYS
    
    TrayIcon.instance
    
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
  
  def toggle_visibility
    self.visible? ? self.hide : self.show
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
    self.signal_connect "delete_event" do
      self.hide_on_delete
    end
  end  
  
end
