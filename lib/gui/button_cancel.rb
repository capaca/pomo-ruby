class ButtonCancel < Gtk::Button

  def initialize text
    super text
    
    @text = text
    add_click_event
  end
  
  private
  
  def add_click_event
    self.signal_connect "clicked" do
      runner = Window.instance.panel.button_start.runner
      if runner
        runner.stop
      end
    end
  end
end
