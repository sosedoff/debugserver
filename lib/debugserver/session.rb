module DebugServer
  class Session < EventMachine::Connection
    include DebugServer::Parser
    include DebugServer::Console
    
    attr_accessor :uid, :server
      
    def receive_data(buffer)
      packets = parse_data(buffer)
      packets.each { |p| process_output(p) }
    end
    
    def unbind
      @server.close_session(self)
    end
  end
end