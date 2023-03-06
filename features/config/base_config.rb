module BaseConfig

  @device_type = ENV['device_type'] || 'simulator'
  def self.device_type
    @device_type
  end

  @wait_time = 15
  def self.wait_time
    @wait_time
  end

  @short_wait_time = 3
  def self.short_wait_time
    @short_wait_time
  end

end











