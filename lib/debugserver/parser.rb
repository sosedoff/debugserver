module DebugServer
  module Parser
    def parse_data(data)
      packets = []
      data.strip.split("\n").each do |str|
        packets << parse_json(str.strip)
      end
      packets.select { |item| !item.nil? }
    end
    
    def parse_json(data)
      JSON.parse(data) rescue nil
    end
  end
end