require "spp/version"
require "pp"

module Spp
  DEFAULT_START_STR = 'START'
  DEFAULT_END_STR   = 'E N D'
  DEFAULT_LINE_STR  = '=========='

  class << self
    def spp(message, start_str=nil, end_str=nil, line_str=nil)
      start_str ||= DEFAULT_START_STR
      end_str   ||= DEFAULT_END_STR
      line_str  ||= DEFAULT_LINE_STR
      puts "#{line_str} #{start_str} #{line_str}"
      pp message
      puts "#{line_str} #{end_str} #{line_str}"
    end
  end
end
