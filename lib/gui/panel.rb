class Panel < Gtk::VBox
  
  attr_reader :tf_pomodoro, :tf_pause, :tf_break, :tf_cycles,
              :hb_start, :progress_bar, :button_start
  
  def initialize
    super true, 2

    @tf_pomodoro = TextField.new "Pomodoro time: ", "25"
    @tf_pause = TextField.new "Pause time: ", "5"
    @tf_break = TextField.new "Break time: ", "30"
    @tf_cycles = TextField.new "How many pomodoros until break? ", "2"
    @hb_buttons = Gtk::HBox.new true, 10
    @button_start = ButtonStart.new "Start!"
    @button_cancel = ButtonCancel.new "Cancel"
    @progress_bar = ProgressBar.new
  
    @hb_buttons.add @button_start
    @hb_buttons.add @button_cancel

    self.add @tf_pomodoro
    self.add @tf_pause
    self.add @tf_break
    self.add @tf_cycles
    self.add @hb_buttons
    self.add @progress_bar
  end
  
end
