class ProgressBar < Gtk::ProgressBar
  
  def initialize
    super
    self.fraction = 0
  end

end
