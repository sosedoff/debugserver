module DebugServer
  # start server
  def self.start
    server = DebugServer::Server.new
    server.start
  end
  
  class Server
    attr_reader :socket
    attr_reader :sessions
    
    private
    
    # init connection
    def init_session(s)
      s.uid = `uuidgen`
      s.server = self
      @sessions << s
    end
    
    public
    
    def initialize
      @socket = nil
      @sessions = []
    end
    
    # close existing session on client disconnect
    def close_session(s)
      @sessions.delete(s)
    end
      
    # start server execution
    def start
      config = DebugServer.config
      
      system('clear')
      puts "Starting debug server on #{config[:host]}:#{config[:port]}..."
      
      begin
        EventMachine::run do
          EventMachine.epoll  
          @socket = EventMachine::start_server(config[:host], config[:port], Session) do |s|
            init_session(s)
          end
        end
      rescue Interrupt
        stop
      rescue RuntimeError => err
        puts "Runtime error: #{err.message}"
        stop
      end
    end
  
    # stop server executions  
    def stop
      puts "Exiting..."
      exit(0)
    end
  end
end