class InputValidator
  def self.validate *args
    args.each do |arg|
      unless validate_integer arg
        return false
      end
    end
    true
  end
  
  def self.validate_integer str
    if str.to_i > 0
      return true
    end
    false
  end
end
