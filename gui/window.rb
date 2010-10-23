class Window < Gtk::Window
  
  include Singleton
  
  attr_reader :panel
  
  def initialize
    super
    
    @panel = Panel.new
    
    self.add panel
    self.show_all

    add_close_event
  end
  
  private 
  
  def add_close_event
    self.signal_connect "destroy" do
      puts "Exiting pomo-ruby..."
      Gtk.main_quit
    end
  end  
  
end
