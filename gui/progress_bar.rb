class ProgressBar < Gtk::ProgressBar
  
  def initialize
    super
    self.fraction = 1
  end

end
