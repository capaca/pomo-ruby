class Timer
  
  # Initialize de timer informing how much time it must take in SECONDS
  def initialize duration
    @duration = duration
  end
  
  def run
    @now = Time.now.to_i
    @future = @now + @duration
    
    while @now < @future
      @now = Time.now.to_i
      Window.instance.panel.progress_bar.fraction = fraction
      Window.instance.panel.progress_bar.text = "Remaining time: #{remaining_time}"
      sleep 1
    end
  end
  
  def diference
    @future - @now
  end
  
  def fraction
    diference.to_f/@duration
  end
  
  def minutes
    (diference/60).to_i
  end
  
  def seconds
    seconds = (diference % 60).to_i
  end
  
  def add_leadind_zero integer
    if integer.to_s.length == 1
      return "0#{integer}"
    end
    
    integer.to_s
  end

  def remaining_time
    minutes_str = add_leadind_zero minutes
    seconds_str = add_leadind_zero seconds
    "#{minutes_str}:#{seconds_str}"
  end
  
end
