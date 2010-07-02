module DebugServer
  METHOD_CLEAR = 1
  METHOD_MESSAGE = 2
  METHOD_DUMP = 3
  
  LEVEL_NONE = 0
  LEVEL_INFO = 1
  LEVEL_WARNING = 2
  LEVEL_ERROR = 3
  
  COLORS = {
    LEVEL_INFO => :green,
    LEVEL_WARNING => :yellow,
    LEVEL_ERROR => :red
  }
  
  @@config = {
    :host => 'localhost',
    :port => '9000'
  }
  
  def self.configure(host='localhost', port=9000)
    @@config[:host] = host
    @@config[:port] = port
  end
  
  def self.config
    @@config
  end
end