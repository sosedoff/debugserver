module DebugServer
  module Console    
    def print_string(content, level=nil)
      unless level.nil?
        content = content.send(COLORS[level]) if COLORS.include?(level)
      end
      puts content
    end
    
    def print_dump(content, name=nil)
      puts "========== #{name} ==========".magenta unless name.nil?
      puts "#{content}\n"
    end
    
    def process_output(packet)
      case packet['method']
        when METHOD_CLEAR
          system('clear')
        when METHOD_MESSAGE
          print_string(packet['content']['message'], packet['content']['level'])
        when METHOD_DUMP
          print_dump(packet['content']['object'], packet['content']['name'])
      end
    end
  end
end