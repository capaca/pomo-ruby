class ButtonStart < Gtk::Button
  
  attr_reader :runner
  
  def initialize text
    super text
    
    @text = text
    add_click_event
  end
  
  def disable text
    self.sensitive = false
    self.label = text
  end
  
  def enable
    self.sensitive = true
    self.label = @text
  end
  
  private
  
  def add_click_event
    self.signal_connect "clicked" do
      cycles = break_time = Window.instance.panel.tf_cycles.text.to_i

      pomodoro_time = Window.instance.panel.tf_pomodoro.text.to_i
      pomodoro_time *= 60
      
      pause_time = Window.instance.panel.tf_pause.text.to_i
      pause_time *= 60 
      
      break_time = Window.instance.panel.tf_pause.text.to_i
      break_time *= 60 

      unless InputValidator.validate pomodoro_time, pause_time, break_time, cycles
        Window.instance.show_warning_dialog "Please, inform valid data for the pomodoro cycle."
      else
        disable  "Running pomodoro..."

        @runner = CycleRunner.new cycles, pomodoro_time, pause_time, break_time
        @runner.run
      end
    end
  end
end
