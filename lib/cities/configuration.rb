module Cities
  @@cache_data = true
  @@data_path = nil

  def self.configure
    yield self
  end

  def self.data_path=(data_path)
    @@data_path = data_path
  end

  def self.data_path
    @@data_path
  end

  def self.cache_data=(cache_flag)
    @@cache_data = cache_flag
  end

  def self.cache_data?
    @@cache_data
  end
end