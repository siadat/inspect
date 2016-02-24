#!/usr/bin/env ruby
require 'json'
require 'csv'
require 'yaml'
require 'nokogiri'

def parse_data(format, data)
  if format.nil?
    if data.match /^\s*</
      x = parse('xml', data)
      x = parse('html', data) if x.children.first.name == 'html'
    else
      x = parse('json', data)
      x = parse('csv', data) if x.nil?
      x = parse('yml', data) if x.nil?
    end
  else
    x = parse(format, data)
  end
  x
end

def infer_format
  unless ARGV[0].nil?
    input = ARGV[0].dup
    format = input.split('.')[-1]
    format
  end
end

def read_data
  # puts "Reading from STDIN..."
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
  when 'yml'
    YAML.load(data)
  when 'xml'
    Nokogiri::XML(data) {|config| config.strict.noblanks}
  end

rescue JSON::ParserError, CSV::MalformedCSVError
end
