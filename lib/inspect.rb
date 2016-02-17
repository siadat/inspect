#!/usr/bin/env ruby
require 'json'
require 'csv'
require 'nokogiri'
def parse_data(format, data)
  if format.nil?
    if data.match /^\s*</
      x = parse('html', data)
    else
      x = parse('json', data)
      x = parse('csv', data) if x.nil?
    end
  else
    x = parse(format, data)
  end
  x
end

def read_data
  puts "Reading from STDIN..."
  ARGF.read
end

def parse(format, data)
  case format
  when 'json'
    JSON.parse(data)
  when 'csv'
    CSV.parse(data)
  when 'html'
    Nokogiri::HTML(data)
  end
rescue JSON::ParserError, CSV::MalformedCSVError
end
