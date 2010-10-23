class Button < Gtk::Button

  def initialize text
    super text
    add_click_event
  end
  
  private
  
  def add_click_event
    self.signal_connect "clicked" do
      pomodoro = Window.instance.panel.tf_pomodoro.text.to_i
      time_now = Time.now.to_i
      time_future = (time_now + (60*pomodoro))
      
      Thread.new do
        puts "Executando a thread!"
        while time_now < time_future
          time_now = Time.now.to_i
          fraction = (time_future-time_now).to_f/(60*pomodoro)
        
          Window.instance.panel.progress_bar.fraction = fraction
          sleep 1
        end
      end
      
    end
  end

end
