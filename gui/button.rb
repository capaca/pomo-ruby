class Button < Gtk::Button

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
      start_pomodoro
    end
  end
  
  def start_pomodoro
    disable "Running pomodoro..."
       
    pomodoro = Window.instance.panel.tf_pomodoro.text.to_i
    pomodoro *= 60 

    timer = Timer.new pomodoro do 
      enable
      Window.instance.pop_up
      start_pause
    end    
    timer.run        
  end
  
  def start_pause
    disable "time for a litle break..."
     
    pause = Window.instance.panel.tf_pause.text.to_i
    pause *= 60 

    timer = Timer.new pause do 
      enable
      Window.instance.pop_up
    end    
    timer.run    
  end
  
  def start_break
    disable "Now it's time to rest..."
     
    pause = Window.instance.panel.tf_break.text.to_i
    pause *= 60 

    timer = Timer.new pause do 
      enable
      Window.instance.pop_up
    end    
    timer.run    
  end
end
