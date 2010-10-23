class Panel < Gtk::VBox
  
  attr_reader :tf_pomodoro, :tf_pause, :tf_break, :tf_cycles,
              :hb_start, :progress_bar, :button_start
  
  def initialize
    super

    @tf_pomodoro = TextField.new "Pomodoro time: ", "25"
    @tf_pause = TextField.new "Pause time: ", "5"
    @tf_break = TextField.new "Break time: ", "30"
    @tf_cycles = TextField.new "Pomodoro cycles until break: ", "2"
    @button_start = Button.new "Start!"
    @progress_bar = ProgressBar.new
  
    self.add @tf_pomodoro
    self.add @tf_pause
    self.add @tf_break
    self.add @tf_cycles
    self.add @button_start
    self.add @progress_bar
  end
  
end
