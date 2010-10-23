class Window < Gtk::Window
  
  include Singleton
  
  attr_reader :panel
  
  def initialize title = "Pomo-ruby"
    super
    
    @panel = Panel.new
    
    self.add panel
    self.show_all
    self.title = title

    add_close_event
  end
  
  def pop_up
    self.keep_above = true
    self.keep_above = false
  end
  
  private 
  
  def add_close_event
    self.signal_connect "destroy" do
      puts "Exiting pomo-ruby..."
      Gtk.main_quit
    end
  end  
  
end
