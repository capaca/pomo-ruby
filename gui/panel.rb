class Panel < Gtk::VBox
  
  attr_reader :tf_pomodoro, :tf_pause, :hb_start, :progress_bar
  
  def initialize
    super

    @tf_pomodoro = TextField.new "Pomodoro: "
    @tf_pause = TextField.new "Pause: "
    @button_start = Button.new "Start!"
    @progress_bar = ProgressBar.new
  
    self.add @tf_pomodoro
    self.add @tf_pause
    self.add @button_start
    self.add @progress_bar
  end
  
end
