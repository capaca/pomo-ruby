class CycleRunner
  
  def initialize cycles, pomodoro_time, pause_time, break_time
    @timer_pomodoro = Timer.new pomodoro_time
    @timer_pause = Timer.new pause_time
    @timer_break = Timer.new break_time
    @cycles = cycles
  end
  
  def run
    @thread = Thread.new do
      begin
        @cycles.times do |i|
          Window.instance.pop_up
          @timer_pomodoro.run
          
          if i + 1 != @cycles
            Window.instance.panel.button_start.label = "Time for a litle pause..."
            Window.instance.pop_up
            @timer_pause.run
          end
        end
        Window.instance.panel.button_start.label = "Now it's time to rest..."
        Window.instance.pop_up
        @timer_break.run
      rescue => e
        puts e
        Thread.stop
      end
      Window.instance.pop_up
      Window.instance.panel.button_start.enable
    end
    
  end
  
  def stop
    @thread.kill
    Window.instance.panel.button_start.enable
    Window.instance.panel.progress_bar.text = "Canceled"
    Window.instance.panel.progress_bar.fraction = 0
  end
end
