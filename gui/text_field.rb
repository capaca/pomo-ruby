class TextField < Gtk::HBox
  
  def initialize label_text
    super
    
    @label = Gtk::Label.new label_text
    @entry = Gtk::Entry.new
    
    self.add @label
    self.add @entry
  end
  
  def text
    @entry.text
  end  
  
end
