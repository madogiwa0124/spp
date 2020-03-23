# frozen_string_literal: true

require 'spp/version'
require 'pp'
require 'date'

module Spp
  DEFAULT_START_STR = 'START'
  DEFAULT_END_STR   = 'E N D'
  DEFAULT_LINE_STR  = '=========='

  class << self
    def spp(message, start_str = nil, end_str = nil, line_str = nil)
      start_str ||= DEFAULT_START_STR
      end_str   ||= DEFAULT_END_STR
      line_str  ||= DEFAULT_LINE_STR
      puts "#{line_str} #{start_str} #{line_str}"
      pp message
      puts "#{line_str} #{end_str} #{line_str}"
    end

    def spp_bench(start_str = nil, end_str = nil, line_str = nil)
      unless block_given?
        puts '[Error] No processing is given. Please give block argument.'
        return false
      end
      start_str ||= DEFAULT_START_STR
      end_str   ||= DEFAULT_END_STR
      line_str  ||= DEFAULT_LINE_STR
      puts "#{line_str} #{start_str}(#{Time.now}) #{line_str}"
      pp yield
      puts "#{line_str} #{end_str}(#{Time.now}) #{line_str}"
    end
  end
end
