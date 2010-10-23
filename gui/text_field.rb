class TextField < Gtk::HBox
  
  def initialize label_text, value
    super(true)
    
    @label = Gtk::Label.new label_text
    @entry = Gtk::Entry.new
    @entry.text = value
    
    self.add @label
    self.add @entry
  end
  
  def text
    @entry.text
  end  
  
end
